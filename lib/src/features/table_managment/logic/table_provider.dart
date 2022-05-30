import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meseros_app/src/features/table_managment/data/models/table_model.dart';
import 'package:meseros_app/src/features/table_managment/data/repositories/table_repository.dart';

final isEditProvider = StateProvider<bool>((ref) => false);

final databaseProvider = Provider<TableRepository?>((ref) {
  return TableRepository();
});
final tablesProvider = StreamProvider.autoDispose<List<TableModel>>((ref) {
  final database = ref.watch(databaseProvider)!;
  return database.tablesStream();
});
