import 'package:injectable/injectable.dart';
import 'package:pasto_hoy/data/local/adapters/plan_entity_adapter.dart';
import 'package:pasto_hoy/data/remote/adapters/plan_dto_adapter.dart';
import 'package:pasto_hoy/data/remote/apis/plan_api.dart';
import 'package:pasto_hoy/data/remote/dtos/plan_dto.dart';
import 'package:pasto_hoy/domain/plans/models/plan.dart';
import 'package:pasto_hoy/domain/plans/repositories/plan_repository.dart';
import 'package:pasto_hoy/domain/util/async_result.dart';

import 'local/daos/plan_dao.dart';

@LazySingleton(as: PlanRepository)
final class PlanRepositoryImpl implements PlanRepository {
  final PlanApi _api;
  final PlanDao _dao;

  PlanRepositoryImpl(this._api, this._dao);


  @override
  Stream<List<Plan>> listenPlans() {
    return _dao.listen()
      .asyncMap((event)  => PlanEntityAdapter.toModelAsync(event));
  }

  @override
  Future<AsyncResult<Empty, Exception>> refreshInfo() async {
    try {
      final result = await _api.getPlans();
      final models = await PlanDtoAdapter.toModelAsync(result);
      final entities = await PlanEntityAdapter.fromModelAsync(models);
      await _dao.insertMany(entities);
      return AsyncResult.success();
    } catch(e){
      return AsyncResult.failure(Exception());
    }
  }

}