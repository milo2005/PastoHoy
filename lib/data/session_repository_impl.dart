import 'package:injectable/injectable.dart';
import 'package:pasto_hoy/domain/account/repositories/session_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton(as: SessionRepository)
final class SessionRepositoryImpl implements SessionRepository {

  final SharedPreferences _preferences;
  SessionRepositoryImpl(this._preferences);

  @override
  String? getToken()  {
    return _preferences.getString("token");
  }

  @override
  Future setToken(String token) async {
    await _preferences.setString("token", token);
  }

}