import '../../../domain/plans/models/plan.dart';

sealed class PlanState {}

class PlanStateLoading extends PlanState {}

class PlanStateError extends PlanState {}

class PlanStateContent extends PlanState {
  final List<Plan> plans;
  PlanStateContent(this.plans);
}