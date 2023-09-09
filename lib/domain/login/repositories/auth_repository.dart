import 'package:pasto_hoy/domain/login/exceptions/login_exceptions.dart';
import 'package:pasto_hoy/domain/login/exceptions/signin_exceptions.dart';
import 'package:pasto_hoy/domain/login/models/credential.dart';
import 'package:pasto_hoy/domain/login/models/user.dart';
import 'package:pasto_hoy/domain/util/async_result.dart';

abstract interface class AuthRepository {
  Future<AsyncResult<String, LoginExceptions>> login(Credentials credentials);
  Future<AsyncResult<String, SignInExceptions>> signIn(User user);
}