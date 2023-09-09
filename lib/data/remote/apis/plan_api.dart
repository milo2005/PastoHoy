import 'package:dio/dio.dart';
import 'package:pasto_hoy/data/remote/dtos/plan_dto.dart';
import 'package:retrofit/http.dart';

part 'plan_api.g.dart';

@RestApi()
abstract class PlanApi {
  factory PlanApi(Dio dio, {String baseUrl}) = _PlanApi;

  @GET("/plans")
  Future<List<PlanDto>> getPlans();

}