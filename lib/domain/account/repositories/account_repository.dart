import 'package:pasto_hoy/domain/account/exceptions/login_exception.dart';
import 'package:pasto_hoy/domain/account/exceptions/signin_exception.dart';
import 'package:pasto_hoy/domain/account/models/credentias.dart';
import 'package:pasto_hoy/domain/account/models/user.dart';
import 'package:pasto_hoy/domain/util/async_result.dart';

abstract interface class AccountRepository {

  Future<AsyncResult<String, LoginException>> login(Credentials credentials);
  Future<AsyncResult<String, SignInException>> signIn(User user);
}