import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pasto_hoy/data/remote/api/auth_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class DataModule {

  // Remote Dependencies
  Dio getDio() => Dio(
    BaseOptions(
      baseUrl: "https://backend.pastohoy.com/"
    )
  );
  AuthApi getAuthApi(Dio dio) => AuthApi(dio);

  // Local Dependencies
  @preResolve
  Future<SharedPreferences> getPreferences() => SharedPreferences.getInstance();
}