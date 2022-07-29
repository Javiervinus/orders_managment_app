import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meseros_app/src/features/table_managment/data/models/table_model.dart';

part 'table_state.freezed.dart';

extension TableGetters on TableState {
  bool get isLoading => this is _TableStateLoading;
  bool get onError => this is _TableStateError;
}

@freezed
abstract class TableState with _$TableState {
  const factory TableState.initial() = _TableStateInital;

  ///Loading
  const factory TableState.loading() = _TableStateLoading;

  ///Data
  const factory TableState.data({required int id}) = _TableStateData;

  ///Error
  const factory TableState.error([String? error]) = _TableStateError;
}
