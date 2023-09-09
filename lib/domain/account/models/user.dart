import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@Freezed()
class User with _$User {
  factory User({
    required String name,
    required String email,
    required String password
  }) = _User;
}
