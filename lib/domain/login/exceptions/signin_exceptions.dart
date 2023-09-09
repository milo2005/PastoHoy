sealed class SignInExceptions implements Exception {
  static SignInExceptions network() => NetworkSignInException();

}

class NetworkSignInException extends SignInExceptions{}