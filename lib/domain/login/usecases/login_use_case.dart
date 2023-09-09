import 'package:injectable/injectable.dart';
import 'package:pasto_hoy/domain/login/exceptions/login_exceptions.dart';
import 'package:pasto_hoy/domain/login/models/credential.dart';
import 'package:pasto_hoy/domain/login/repositories/auth_repository.dart';
import 'package:pasto_hoy/domain/login/repositories/session_repository.dart';
import 'package:pasto_hoy/domain/util/async_result.dart';

@lazySingleton
final class LoginUseCase {

  final AuthRepository _authRepository;
  final SessionRepository _sessionRepository;
  LoginUseCase(this._sessionRepository, this._authRepository);

  Future<AsyncResult<Empty,LoginExceptions>> call(Credentials credentials) async {
    final result = await _authRepository.login(credentials);

    if(result.isFailure()) {
      return AsyncResult.failure(result.getException());
    }

    final token = result.getValue();
    _sessionRepository.setToken(token);

    return AsyncResult.success();
  }


}