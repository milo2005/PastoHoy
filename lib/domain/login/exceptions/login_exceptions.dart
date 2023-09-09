sealed class LoginExceptions implements Exception {
  static LoginExceptions invalidCredentials() => InvalidCredentialsException();
  static LoginExceptions network() => NetworkLoginException();
}

class InvalidCredentialsException extends LoginExceptions {}
class NetworkLoginException extends LoginExceptions {}
