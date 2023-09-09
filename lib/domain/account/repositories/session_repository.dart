abstract interface class SessionRepository {

  String? getToken();
  Future setToken(String token);
}