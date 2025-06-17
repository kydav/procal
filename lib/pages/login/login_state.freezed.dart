// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LoginState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LoginState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'LoginState()';
  }
}

/// @nodoc
class $LoginStateCopyWith<$Res> {
  $LoginStateCopyWith(LoginState _, $Res Function(LoginState) __);
}

/// @nodoc

class _LoginInitial implements LoginState {
  const _LoginInitial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _LoginInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'LoginState.initial()';
  }
}

/// @nodoc

class _LoginLoading implements LoginState {
  const _LoginLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _LoginLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'LoginState.loading()';
  }
}

/// @nodoc

class _LoginAuthenticated implements LoginState {
  const _LoginAuthenticated();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _LoginAuthenticated);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'LoginState.authenticated()';
  }
}

/// @nodoc

class _LoginError implements LoginState {
  const _LoginError(this.errorText);

  final String errorText;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LoginErrorCopyWith<_LoginError> get copyWith =>
      __$LoginErrorCopyWithImpl<_LoginError>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoginError &&
            (identical(other.errorText, errorText) ||
                other.errorText == errorText));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorText);

  @override
  String toString() {
    return 'LoginState.error(errorText: $errorText)';
  }
}

/// @nodoc
abstract mixin class _$LoginErrorCopyWith<$Res>
    implements $LoginStateCopyWith<$Res> {
  factory _$LoginErrorCopyWith(
          _LoginError value, $Res Function(_LoginError) _then) =
      __$LoginErrorCopyWithImpl;
  @useResult
  $Res call({String errorText});
}

/// @nodoc
class __$LoginErrorCopyWithImpl<$Res> implements _$LoginErrorCopyWith<$Res> {
  __$LoginErrorCopyWithImpl(this._self, this._then);

  final _LoginError _self;
  final $Res Function(_LoginError) _then;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? errorText = null,
  }) {
    return _then(_LoginError(
      null == errorText
          ? _self.errorText
          : errorText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
