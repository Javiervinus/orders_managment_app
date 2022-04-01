import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meseros_app/src/features/authentication/data/models/user_model.dart';
part 'auth_state.freezed.dart';

extension AuthGetters on AuthState {
  bool get isLoading => this is _AuthStateLoading;
  bool get onError => this is _AuthStateError;
}

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState.initial() = _AuthStateInital;

  ///Loading
  const factory AuthState.loading() = _AuthStateLoading;

  ///Data
  const factory AuthState.data({required UserModel user}) = _AuthStateData;

  ///Error
  const factory AuthState.error([String? error]) = _AuthStateError;
}
