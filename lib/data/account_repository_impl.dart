import 'package:injectable/injectable.dart';
import 'package:pasto_hoy/data/remote/adapters/credential_dto_adapter.dart';
import 'package:pasto_hoy/data/remote/adapters/user_dto_adapter.dart';
import 'package:pasto_hoy/data/remote/apis/auth_api.dart';
import 'package:pasto_hoy/data/remote/dtos/credential_dto.dart';
import 'package:pasto_hoy/domain/account/exceptions/login_exception.dart';
import 'package:pasto_hoy/domain/account/exceptions/signin_exception.dart';
import 'package:pasto_hoy/domain/account/models/credentias.dart';
import 'package:pasto_hoy/domain/account/models/user.dart';
import 'package:pasto_hoy/domain/account/repositories/account_repository.dart';
import 'package:pasto_hoy/domain/util/async_result.dart';
import 'package:dio/dio.dart';

@LazySingleton(as: AccountRepository)
final class AccountRepositoryImpl implements AccountRepository {

  final AuthApi _api;
  AccountRepositoryImpl(this._api);

  @override
  Future<AsyncResult<String, LoginException>> login(Credentials credentials) async {
    final dto = CredentialDtoAdapter.fromModel(credentials);
    try {
      final result = await _api.login(dto);
      return AsyncResult.successWithData(result.token);
    } on DioException catch(e) {
      if(e.response?.statusCode == 401) {
        return AsyncResult.failure(InvalidCredentialsException());
      }
      return AsyncResult.failure(NetworkLoginException());
    }
  }

  @override
  Future<AsyncResult<String, SignInException>> signIn(User user) async {
    final dto = UserDtoAdapter.fromModel(user);
    try {
      final result = await _api.signIn(dto);
      return AsyncResult.successWithData(result.token);
    } catch(e) {
      return AsyncResult.failure(NetworkSignInException());
    }
  }

}