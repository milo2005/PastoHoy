import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pasto_hoy/domain/plans/models/plan_item.dart';

part "plan.freezed.dart";

@Freezed()
class Plan with _$Plan {
  factory Plan({
    required String id,
    required String name,
    required String description,
    required String shortDescription,
    required List<PlanItem> items,
    required String image,
    String? url,
  }) = _Plan;
}