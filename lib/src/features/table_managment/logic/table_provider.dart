import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meseros_app/src/features/authentication/logic/auth_provider.dart';
import 'package:meseros_app/src/features/table_managment/data/models/table_model.dart';
import 'package:meseros_app/src/features/table_managment/data/repositories/table_repository.dart';

final isEditProvider = StateProvider<bool>((ref) => false);
final mapProvider = FutureProvider<Map<String, dynamic>?>((ref) {
  final database = ref.watch(databaseProvider)!;
  final auth = ref.watch(authNotifierProvider);
  return database.getMap(auth.whenOrNull(
    data: (user) => user.id,
  )!);
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
