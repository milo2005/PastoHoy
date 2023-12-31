import 'package:injectable/injectable.dart';

import '../domain/login/repositories/session_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton(as: SessionRepository)
final class SessionRepositoryImpl implements SessionRepository {

  final SharedPreferences _preferences;
  SessionRepositoryImpl(this._preferences);

  @override
  String? getToken() {
    return _preferences.getString("token");
  }

  @override
  setToken(String token) {
    _preferences.setString("token", token);
  }
}
