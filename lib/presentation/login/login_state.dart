import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pasto_hoy/domain/login/exceptions/login_exceptions.dart';

part "login_state.freezed.dart";

@Freezed()
class LoginState with _$LoginState {
  factory LoginState({
    required bool isLoading,
    LoginExceptions? error,
    bool? success
  }) = _LoginState;
}