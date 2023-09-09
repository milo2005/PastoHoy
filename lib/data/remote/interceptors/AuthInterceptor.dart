import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pasto_hoy/domain/account/repositories/session_repository.dart';

@lazySingleton
final class AuthInterceptor extends InterceptorsWrapper {
  final SessionRepository _repository;

  AuthInterceptor(this._repository);


  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = _repository.getToken();
    if(token != null) {
      options.headers["Authorization"] = "Bearer $token";
    }

    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }
}