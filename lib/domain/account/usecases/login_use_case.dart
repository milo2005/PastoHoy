import 'dart:ffi';

import 'package:injectable/injectable.dart';
import 'package:pasto_hoy/domain/account/exceptions/login_exception.dart';
import 'package:pasto_hoy/domain/account/models/credentias.dart';
import 'package:pasto_hoy/domain/account/repositories/account_repository.dart';
import 'package:pasto_hoy/domain/util/async_result.dart';

import '../repositories/session_repository.dart';

@lazySingleton
final class LoginUseCase {

  final AccountRepository _accountRepository;
  final SessionRepository _sessionRepository;
  LoginUseCase(this._accountRepository, this._sessionRepository);

  Future<AsyncResult<Empty, LoginException>> call(Credentials credentials) async {
    final result  = await _accountRepository.login(credentials);

    if(result.isFailure()) {
      return AsyncResult.failure(result.getException());
    }

    final token = result.getValue();
    await _sessionRepository.setToken(token);
    return AsyncResult.success();
  }
}