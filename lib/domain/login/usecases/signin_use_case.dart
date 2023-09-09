import 'package:pasto_hoy/domain/login/exceptions/signin_exceptions.dart';
import 'package:pasto_hoy/domain/login/repositories/auth_repository.dart';
import 'package:pasto_hoy/domain/login/repositories/session_repository.dart';

import '../../util/async_result.dart';
import '../models/user.dart';

final class SignInUseCase {

  final AuthRepository _authRepository;
  final SessionRepository _sessionRepository;
  SignInUseCase(this._sessionRepository, this._authRepository);

  Future<AsyncResult<Empty,SignInExceptions>> call(User user) async {
    final result = await _authRepository.signIn(user);

    if(result.isFailure()) {
      return AsyncResult.failure(result.getException());
    }

    final token = result.getValue();
    _sessionRepository.setToken(token);

    return AsyncResult.success();
  }


}