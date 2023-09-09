import 'package:freezed_annotation/freezed_annotation.dart';

part "plan_item.freezed.dart";

@Freezed()
class PlanItem with _$PlanItem {
  factory PlanItem({
    required String name,
    required String description,
    String? phone,
    String? address,
    String? image,
  }) = _PlanItem;
}