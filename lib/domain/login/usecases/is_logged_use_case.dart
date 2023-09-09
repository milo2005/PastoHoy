import 'package:injectable/injectable.dart';
import 'package:pasto_hoy/domain/login/repositories/session_repository.dart';

@lazySingleton
final class IsLoggedUseCase {

  final SessionRepository _repository;
  IsLoggedUseCase(this._repository);

  bool call() {
    return _repository.getToken() != null;
  }
}