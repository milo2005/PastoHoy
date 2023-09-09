import 'package:injectable/injectable.dart';
import 'package:pasto_hoy/domain/account/exceptions/login_exception.dart';
import 'package:pasto_hoy/domain/account/exceptions/signin_exception.dart';
import 'package:pasto_hoy/domain/account/repositories/account_repository.dart';
import 'package:pasto_hoy/domain/account/repositories/session_repository.dart';
import 'package:pasto_hoy/domain/util/async_result.dart';

import '../models/user.dart';

@lazySingleton
final class SignInUseCase {

  final AccountRepository _accountRepository;
  final SessionRepository _sessionRepository;
  SignInUseCase(this._accountRepository, this._sessionRepository);

  Future<AsyncResult<Empty, SignInException>> call(User user) async {
      final result = await _accountRepository.signIn(user);
      if(result.isFailure()) {
        return AsyncResult.failure(result.getException());
      }

      final token = result.getValue();
      _sessionRepository.setToken(token);
      return AsyncResult.success();
  }
}