// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'table_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$TableStateTearOff {
  const _$TableStateTearOff();

  _TableStateInital initial() {
    return const _TableStateInital();
  }

  _TableStateLoading loading() {
    return const _TableStateLoading();
  }

  _TableStateData data({required int id}) {
    return _TableStateData(
      id: id,
    );
  }

  _TableStateError error([String? error]) {
    return _TableStateError(
      error,
    );
  }
}

/// @nodoc
const $TableState = _$TableStateTearOff();

/// @nodoc
mixin _$TableState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(int id) data,
    required TResult Function(String? error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(int id)? data,
    TResult Function(String? error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(int id)? data,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TableStateInital value) initial,
    required TResult Function(_TableStateLoading value) loading,
    required TResult Function(_TableStateData value) data,
    required TResult Function(_TableStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_TableStateInital value)? initial,
    TResult Function(_TableStateLoading value)? loading,
    TResult Function(_TableStateData value)? data,
    TResult Function(_TableStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TableStateInital value)? initial,
    TResult Function(_TableStateLoading value)? loading,
    TResult Function(_TableStateData value)? data,
    TResult Function(_TableStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TableStateCopyWith<$Res> {
  factory $TableStateCopyWith(
          TableState value, $Res Function(TableState) then) =
      _$TableStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$TableStateCopyWithImpl<$Res> implements $TableStateCopyWith<$Res> {
  _$TableStateCopyWithImpl(this._value, this._then);

  final TableState _value;
  // ignore: unused_field
  final $Res Function(TableState) _then;
}

/// @nodoc
abstract class _$TableStateInitalCopyWith<$Res> {
  factory _$TableStateInitalCopyWith(
          _TableStateInital value, $Res Function(_TableStateInital) then) =
      __$TableStateInitalCopyWithImpl<$Res>;
}

/// @nodoc
class __$TableStateInitalCopyWithImpl<$Res>
    extends _$TableStateCopyWithImpl<$Res>
    implements _$TableStateInitalCopyWith<$Res> {
  __$TableStateInitalCopyWithImpl(
      _TableStateInital _value, $Res Function(_TableStateInital) _then)
      : super(_value, (v) => _then(v as _TableStateInital));

  @override
  _TableStateInital get _value => super._value as _TableStateInital;
}

/// @nodoc

class _$_TableStateInital implements _TableStateInital {
  const _$_TableStateInital();

  @override
  String toString() {
    return 'TableState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _TableStateInital);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(int id) data,
    required TResult Function(String? error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(int id)? data,
    TResult Function(String? error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(int id)? data,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TableStateInital value) initial,
    required TResult Function(_TableStateLoading value) loading,
    required TResult Function(_TableStateData value) data,
    required TResult Function(_TableStateError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_TableStateInital value)? initial,
    TResult Function(_TableStateLoading value)? loading,
    TResult Function(_TableStateData value)? data,
    TResult Function(_TableStateError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TableStateInital value)? initial,
    TResult Function(_TableStateLoading value)? loading,
    TResult Function(_TableStateData value)? data,
    TResult Function(_TableStateError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _TableStateInital implements TableState {
  const factory _TableStateInital() = _$_TableStateInital;
}

/// @nodoc
abstract class _$TableStateLoadingCopyWith<$Res> {
  factory _$TableStateLoadingCopyWith(
          _TableStateLoading value, $Res Function(_TableStateLoading) then) =
      __$TableStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$TableStateLoadingCopyWithImpl<$Res>
    extends _$TableStateCopyWithImpl<$Res>
    implements _$TableStateLoadingCopyWith<$Res> {
  __$TableStateLoadingCopyWithImpl(
      _TableStateLoading _value, $Res Function(_TableStateLoading) _then)
      : super(_value, (v) => _then(v as _TableStateLoading));

  @override
  _TableStateLoading get _value => super._value as _TableStateLoading;
}

/// @nodoc

class _$_TableStateLoading implements _TableStateLoading {
  const _$_TableStateLoading();

  @override
  String toString() {
    return 'TableState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _TableStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(int id) data,
    required TResult Function(String? error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(int id)? data,
    TResult Function(String? error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(int id)? data,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TableStateInital value) initial,
    required TResult Function(_TableStateLoading value) loading,
    required TResult Function(_TableStateData value) data,
    required TResult Function(_TableStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_TableStateInital value)? initial,
    TResult Function(_TableStateLoading value)? loading,
    TResult Function(_TableStateData value)? data,
    TResult Function(_TableStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TableStateInital value)? initial,
    TResult Function(_TableStateLoading value)? loading,
    TResult Function(_TableStateData value)? data,
    TResult Function(_TableStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _TableStateLoading implements TableState {
  const factory _TableStateLoading() = _$_TableStateLoading;
}

/// @nodoc
abstract class _$TableStateDataCopyWith<$Res> {
  factory _$TableStateDataCopyWith(
          _TableStateData value, $Res Function(_TableStateData) then) =
      __$TableStateDataCopyWithImpl<$Res>;
  $Res call({int id});
}

/// @nodoc
class __$TableStateDataCopyWithImpl<$Res> extends _$TableStateCopyWithImpl<$Res>
    implements _$TableStateDataCopyWith<$Res> {
  __$TableStateDataCopyWithImpl(
      _TableStateData _value, $Res Function(_TableStateData) _then)
      : super(_value, (v) => _then(v as _TableStateData));

  @override
  _TableStateData get _value => super._value as _TableStateData;

  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(_TableStateData(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_TableStateData implements _TableStateData {
  const _$_TableStateData({required this.id});

  @override
  final int id;

  @override
  String toString() {
    return 'TableState.data(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TableStateData &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(id);

  @JsonKey(ignore: true)
  @override
  _$TableStateDataCopyWith<_TableStateData> get copyWith =>
      __$TableStateDataCopyWithImpl<_TableStateData>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(int id) data,
    required TResult Function(String? error) error,
  }) {
    return data(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(int id)? data,
    TResult Function(String? error)? error,
  }) {
    return data?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(int id)? data,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TableStateInital value) initial,
    required TResult Function(_TableStateLoading value) loading,
    required TResult Function(_TableStateData value) data,
    required TResult Function(_TableStateError value) error,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_TableStateInital value)? initial,
    TResult Function(_TableStateLoading value)? loading,
    TResult Function(_TableStateData value)? data,
    TResult Function(_TableStateError value)? error,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TableStateInital value)? initial,
    TResult Function(_TableStateLoading value)? loading,
    TResult Function(_TableStateData value)? data,
    TResult Function(_TableStateError value)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class _TableStateData implements TableState {
  const factory _TableStateData({required int id}) = _$_TableStateData;

  int get id => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$TableStateDataCopyWith<_TableStateData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$TableStateErrorCopyWith<$Res> {
  factory _$TableStateErrorCopyWith(
          _TableStateError value, $Res Function(_TableStateError) then) =
      __$TableStateErrorCopyWithImpl<$Res>;
  $Res call({String? error});
}

/// @nodoc
class __$TableStateErrorCopyWithImpl<$Res>
    extends _$TableStateCopyWithImpl<$Res>
    implements _$TableStateErrorCopyWith<$Res> {
  __$TableStateErrorCopyWithImpl(
      _TableStateError _value, $Res Function(_TableStateError) _then)
      : super(_value, (v) => _then(v as _TableStateError));

  @override
  _TableStateError get _value => super._value as _TableStateError;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_TableStateError(
      error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_TableStateError implements _TableStateError {
  const _$_TableStateError([this.error]);

  @override
  final String? error;

  @override
  String toString() {
    return 'TableState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TableStateError &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(error);

  @JsonKey(ignore: true)
  @override
  _$TableStateErrorCopyWith<_TableStateError> get copyWith =>
      __$TableStateErrorCopyWithImpl<_TableStateError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(int id) data,
    required TResult Function(String? error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(int id)? data,
    TResult Function(String? error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(int id)? data,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TableStateInital value) initial,
    required TResult Function(_TableStateLoading value) loading,
    required TResult Function(_TableStateData value) data,
    required TResult Function(_TableStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_TableStateInital value)? initial,
    TResult Function(_TableStateLoading value)? loading,
    TResult Function(_TableStateData value)? data,
    TResult Function(_TableStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TableStateInital value)? initial,
    TResult Function(_TableStateLoading value)? loading,
    TResult Function(_TableStateData value)? data,
    TResult Function(_TableStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _TableStateError implements TableState {
  const factory _TableStateError([String? error]) = _$_TableStateError;

  String? get error => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$TableStateErrorCopyWith<_TableStateError> get copyWith =>
      throw _privateConstructorUsedError;
}
