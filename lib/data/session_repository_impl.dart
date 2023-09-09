import '../domain/login/repositories/session_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

final class SessionRepositoryImpl implements SessionRepository {

  final SharedPreferences _preferences;
  SessionRepositoryImpl(this._preferences);

  @override
  String? getToken() {
    _preferences.getString("token");
  }

  @override
  setToken(String token) {
    _preferences.setString("token", token);
  }
}