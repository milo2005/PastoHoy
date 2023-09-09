import 'package:injectable/injectable.dart';
import 'package:pasto_hoy/domain/plans/repositories/plan_repository.dart';
import 'package:pasto_hoy/domain/util/async_result.dart';

@lazySingleton
final class RefreshPlansUseCase{

  final PlanRepository _repository;

  RefreshPlansUseCase(this._repository);

  Future<AsyncResult<Empty, Exception>> call(){
    return _repository.refreshInfo();
  }

}