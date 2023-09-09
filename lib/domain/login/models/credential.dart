import 'package:freezed_annotation/freezed_annotation.dart';

part "credential.freezed.dart";

@Freezed()
class Credentials with _$Credentials {
  factory Credentials({
    required String email,
    required String password
  }) = _Credentials;
}