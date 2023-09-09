sealed class LoginException implements Exception { }
class InvalidCredentialsException extends LoginException {}
class NetworkLoginException extends LoginException {}


