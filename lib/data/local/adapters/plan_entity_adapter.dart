import 'package:flutter/foundation.dart';
import 'package:objectbox/objectbox.dart';
import 'package:pasto_hoy/data/local/entities/plan_entity.dart';
import 'package:pasto_hoy/domain/plans/models/plan_item.dart';

import '../../../domain/plans/models/plan.dart';

class PlanEntityAdapter {
  static Plan toModel(PlanEntity entity) => Plan(
      id: entity.serverId,
      name: entity.name,
      description: entity.description,
      image: entity.image,
      shortDescription: entity.shortDescription,
      url: entity.url,
      items: entity.items
          .map((element) => PlanItem(
              name: element.name,
              description: element.description,
              image: element.image,
              address: element.address,
              phone: element.phone))
          .toList());

  static Future<List<Plan>> toModelAsync(List<PlanEntity> entities) {
    return compute(
      (entity) => entities.map((e) => PlanEntityAdapter.toModel(e)).toList(),
      entities,
    );
  }

  static PlanEntity fromModel(Plan model) => PlanEntity(
        name: model.name,
        image: model.image,
        shortDescription: model.shortDescription,
        description: model.description,
        serverId: model.id,
        url: model.url,
        items: ToMany()
          ..addAll(
            model.items.map(
              (e) => PlanItemEntity(
                name: e.name,
                description: e.description,
                image: e.image,
                phone: e.phone,
                address: e.address,
                createdAt: DateTime.now()
              ),
            ),
          ),
      );

  static Future<List<PlanEntity>> fromModelAsync(List<Plan> models) {
    return compute(
      (models) => models.map((e) => PlanEntityAdapter.fromModel(e)).toList(),
      models,
    );
  }
}
