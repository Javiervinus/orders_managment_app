import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meseros_app/src/features/authentication/logic/auth_provider.dart';
import 'package:meseros_app/src/features/table_managment/data/models/table_model.dart';
import 'package:meseros_app/src/features/table_managment/data/repositories/table_repository.dart';
import 'package:meseros_app/src/features/table_managment/data/repositories/table_repository_http.dart';
import 'package:meseros_app/src/features/table_managment/logic/table_state.dart';

part 'table_state_notifier.dart';

final isEditProvider = StateProvider<bool>((ref) => false);
final isOpenDialog =
    Provider<ValueNotifier<bool>>((ref) => ValueNotifier(false));

final mapProvider = FutureProvider<Map<String, dynamic>?>((ref) {
  final database = ref.watch(databaseProvider)!;
  final auth = ref.watch(authNotifierProvider);
  return database.getMap(auth.whenOrNull(
    data: (user) => user.id,
  )!);
});
final databaseProviderHttp = Provider<TableRepositoryHttp?>((ref) {
  return TableRepositoryHttp();
});
final databaseProvider = Provider<TableRepository?>((ref) {
  return TableRepository();
});
final tablesProvider = StreamProvider.autoDispose<List<TableModel>>((ref) {
  final database = ref.watch(databaseProvider)!;
  return database.tablesStream();
});

final mapObj = Provider<Map<String, dynamic>?>(
  (ref) {
    final database = ref.watch(databaseProvider)!;
    return database.map;
  },
);
final isLoadingDeleteProvider = StateProvider<bool>((ref) => false);

final tableStateProvider = StateNotifierProvider<TableNotifier, TableState>(
    (ref) => TableNotifier(
        tableRepositoryHttp: ref.watch(databaseProviderHttp)!,
        tableRepository: ref.watch(databaseProvider)!));

final deleteTableProvider = FutureProvider.autoDispose.family<bool, TableModel>(
  (ref, table) async {
    ref.refresh(isLoadingDeleteProvider.notifier).state = true;
    final databaseHttp = ref.watch(databaseProviderHttp)!;
    final database = ref.watch(databaseProvider)!;
    final response = await databaseHttp.deleteTable(table.id!);
    if (response) {
      database.deleteTable(table);
      ref.refresh(isLoadingDeleteProvider.notifier).state = false;

      return true;
    }
    ref.refresh(isLoadingDeleteProvider.notifier).state = false;

    return false;
  },
);
