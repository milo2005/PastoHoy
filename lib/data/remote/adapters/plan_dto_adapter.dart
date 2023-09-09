import 'package:flutter/foundation.dart';
import 'package:pasto_hoy/domain/plans/models/plan.dart';
import 'package:pasto_hoy/domain/plans/models/plan_item.dart';

import '../dtos/plan_dto.dart';

class PlanDtoAdapter {
  static Plan toModel(PlanDto data) => Plan(
        id: data.id,
        image: data.image,
        description: data.description,
        shortDescription: data.shortDescription,
        name: data.name,
        url: data.url,
        items: data.items
            .map(
              (e) => PlanItem(
                  name: e.name,
                  description: e.description,
                  image: e.image,
                  address: e.address,
                  phone: e.phone),
            )
            .toList(),
      );

  static Future<List<Plan>> toModelAsync(List<PlanDto> entities) {
    return compute(
      (entity) => entities.map((e) => PlanDtoAdapter.toModel(e)).toList(),
      entities,
    );
  }

  static PlanDto fromModel(Plan model) => PlanDto(
        image: model.image,
        id: model.id,
        name: model.name,
        shortDescription: model.shortDescription,
        description: model.description,
        url: model.url,
        items: model.items
            .map((e) => PlanItemDto(
                  name: e.name,
                  description: e.description,
                  image: e.image,
                  phone: e.phone,
                  address: e.address,
                ))
            .toList(),
      );

  static Future<List<PlanDto>> fromModelAsync(List<Plan> models) {
    return compute(
      (models) =>
          models.map((model) => PlanDtoAdapter.fromModel(model)).toList(),
      models,
    );
  }
}
