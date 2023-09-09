import 'package:freezed_annotation/freezed_annotation.dart';

part "credentias.freezed.dart";

@Freezed()
class Credentials with _$Credentials {
  factory Credentials({
    required String email,
    required String password,
  }) = _Credentials;
}
