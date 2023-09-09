import '../../util/async_result.dart';
import '../models/plan.dart';

abstract interface class PlanRepository {

  Stream<List<Plan>> listenPlans();

  Future<AsyncResult<Empty, Exception>> refreshInfo();

}