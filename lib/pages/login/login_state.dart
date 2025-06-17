import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = _LoginInitial;
  const factory LoginState.loading() = _LoginLoading;
  const factory LoginState.authenticated() = _LoginAuthenticated;
  const factory LoginState.error(String errorText) = _LoginError;
}
