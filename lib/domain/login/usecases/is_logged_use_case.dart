import 'package:pasto_hoy/domain/login/repositories/session_repository.dart';

final class IsLoggedUseCase {

  final SessionRepository _repository;
  IsLoggedUseCase(this._repository);

  bool call() {
    return _repository.getToken() != null;
  }
}