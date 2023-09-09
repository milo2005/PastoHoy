import 'package:injectable/injectable.dart';
import 'package:pasto_hoy/domain/plans/models/plan.dart';
import 'package:pasto_hoy/domain/plans/repositories/plan_repository.dart';
import 'package:pasto_hoy/domain/util/async_result.dart';

@lazySingleton
final class ListenPlansUseCase {

  final PlanRepository _repository;

  ListenPlansUseCase(this._repository);

  Stream<List<Plan>> call(){
    return _repository.listenPlans();
  }
}