import 'package:json_annotation/json_annotation.dart';

part 'plan_dto.g.dart';

@JsonSerializable()
class PlanItemDto {
  final String name;
  final String description;
  final String? phone;
  final String? address;
  final String? image;

  PlanItemDto({
    required this.name,
    required this.description,
    this.phone,
    this.address,
    this.image,
  });

  factory PlanItemDto.fromJson(Map<String, dynamic> json) =>
      _$PlanItemDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PlanItemDtoToJson(this);
}

@JsonSerializable()
final class PlanDto {
  final String id;
  final String name;
  final String description;
  final String shortDescription;
  final List<PlanItemDto> items;
  final String image;
  final String? url;

  PlanDto({
    required this.id,
    required this.name,
    required this.description,
    required this.shortDescription,
    required this.items,
    required this.image,
    this.url,
  });

  factory PlanDto.fromJson(Map<String, dynamic> json) =>
      _$PlanDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PlanDtoToJson(this);
}
