import 'package:freezed_annotation/freezed_annotation.dart';

part "login_state.freezed.dart";

@Freezed()
class LoginState with _$LoginState {
  factory LoginState({
    @Default(false) bool loading,
    String? errorMessage,
    bool? success
  }) = _LoginState;
}