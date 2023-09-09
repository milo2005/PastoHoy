import 'package:injectable/injectable.dart';
import 'package:pasto_hoy/domain/account/repositories/session_repository.dart';

@lazySingleton
final class IsLoggedUseCase {

  final SessionRepository _repository;
  IsLoggedUseCase(this._repository);

  bool call() {
      final token = _repository.getToken();
      return token != null;
  }
}