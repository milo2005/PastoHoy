import 'package:json_annotation/json_annotation.dart';

part 'token_dto.g.dart';

@JsonSerializable()
final class TokenDto {

  final String token;

  TokenDto({required this.token});

  factory TokenDto.fromJson(Map<String, dynamic> json) => _$TokenDtoFromJson(json);
  Map<String, dynamic> toJson() => _$TokenDtoToJson(this);

}