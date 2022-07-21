import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meseros_app/src/features/table_managment/data/models/table_model.dart';
import 'package:meseros_app/src/features/table_managment/data/repositories/table_repository.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

final isEditProvider = StateProvider<bool>((ref) => false);
final matrixProvider = StateProvider<Matrix4>((ref) {
  Matrix4 matrix = Matrix4.identity();
  matrix.scale(vector.Vector3(0.61, 0.61, 0));

  return matrix;
});

final isChanging = StateProvider<ValueNotifier<int>>((ref) => ValueNotifier(0));

final databaseProvider = Provider<TableRepository?>((ref) {
  return TableRepository();
});
final tablesProvider = StreamProvider.autoDispose<List<TableModel>>((ref) {
  final database = ref.watch(databaseProvider)!;
  return database.tablesStream();
});
