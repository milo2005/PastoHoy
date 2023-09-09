import 'package:dio/dio.dart';
import 'package:pasto_hoy/data/remote/adapter/credential_dto_adapter.dart';
import 'package:pasto_hoy/data/remote/adapter/user_dto_adapter.dart';
import 'package:pasto_hoy/data/remote/api/auth_api.dart';
import 'package:pasto_hoy/domain/login/exceptions/login_exceptions.dart';
import 'package:pasto_hoy/domain/login/exceptions/signin_exceptions.dart';
import 'package:pasto_hoy/domain/login/models/credential.dart';
import 'package:pasto_hoy/domain/login/models/user.dart';
import 'package:pasto_hoy/domain/login/repositories/auth_repository.dart';
import 'package:pasto_hoy/domain/util/async_result.dart';

final class AuthRepositoryImpl implements AuthRepository {
  final AuthApi _api;
  AuthRepositoryImpl(this._api);

  @override
  Future<AsyncResult<String, LoginExceptions>> login(Credentials credentials) async {
    try {
      final dto = CredentialDtoAdapter.fromModel(credentials);
      final result = await _api.login(dto);
      return AsyncResult.successWithData(result.token);
    } on DioException catch(e) {
      if(e.response?.statusCode == 404){
        return AsyncResult.failure(LoginExceptions.invalidCredentials());
      }
      return AsyncResult.failure(LoginExceptions.network());

    }
  }

  @override
  Future<AsyncResult<String, SignInExceptions>> signIn(User user) async {
    try {
      final dto = UserDtoAdapter.fromModel(user);
      final result = await _api.signIn(dto);
      return AsyncResult.successWithData(result.token);
    } catch(e) {
      return AsyncResult.failure(SignInExceptions.network());
    }
  }

}