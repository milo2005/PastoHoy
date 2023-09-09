import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:objectbox/objectbox.dart';
import 'package:pasto_hoy/data/remote/apis/auth_api.dart';
import 'package:pasto_hoy/data/remote/apis/plan_api.dart';
import 'package:pasto_hoy/data/remote/interceptors/AuthInterceptor.dart';
import 'package:pasto_hoy/objectbox.g.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class DataModule {
  Dio getDio(AuthInterceptor interceptor) =>
      Dio(BaseOptions(baseUrl: ""))
        ..interceptors.add(interceptor);

  PlanApi getPlanApi(Dio dio) => PlanApi(dio);

  AuthApi getAuthApi(Dio dio) => AuthApi(dio);

  @preResolve
  Future<SharedPreferences> get preferences => SharedPreferences.getInstance();

  @preResolve
  Future<Store> get store => openStore();
}
