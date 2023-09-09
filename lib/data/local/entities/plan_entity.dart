import 'package:objectbox/objectbox.dart';

@Entity()
class PlanItemEntity {
  @Id()
  int id;
  final String name;
  final String description;
  final String? phone;
  final String? address;
  final String? image;
  final DateTime createdAt;

  final planEntity =  ToOne<PlanEntity>();

  PlanItemEntity({
    this.id = 0,
    required this.name,
    required this.description,
    this.phone,
    this.address,
    this.image,
    required this.createdAt
  });
}

@Entity()
class PlanEntity {
  @Id()
  int id;
  final String serverId;
  final String name;
  final String description;
  final String shortDescription;
  @Backlink("planEntity")
  final ToMany<PlanItemEntity> items;
  final String image;
  final String? url;

  PlanEntity({
    this.id = 0,
    required this.serverId,
    required this.name,
    required this.description,
    required this.shortDescription,
    required this.items,
    required this.image,
    this.url,
  });
}
