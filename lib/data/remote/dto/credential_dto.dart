import 'package:json_annotation/json_annotation.dart';

part 'credential_dto.g.dart';

@JsonSerializable()
class CredentialDto {
  final String email;
  final String password;

  CredentialDto({
    required this.email,
    required this.password,
  });

  factory CredentialDto.fromJson(Map<String, dynamic> json) =>
      _$CredentialDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CredentialDtoToJson(this);
}
