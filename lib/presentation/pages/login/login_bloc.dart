import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:pasto_hoy/domain/account/exceptions/login_exception.dart';
import 'package:pasto_hoy/domain/account/models/credentias.dart';
import 'package:pasto_hoy/domain/util/async_result.dart';

import '../../../domain/account/usecases/login_use_case.dart';
import 'login_state.dart';

@injectable
class LoginBloc extends Cubit<LoginState>{
  final LoginUseCase _loginUseCase;

  LoginBloc(this._loginUseCase):super(LoginState());

  login(String email, String password) async {
    emit(state.copyWith(loading: true));
    final result = await _loginUseCase(Credentials(email: email, password: password));
    switch(result) {
      case Success<Empty, LoginException>():
        emit(state.copyWith(loading: false, success: true));

      case Failure<Empty, LoginException>():
        emit(state.copyWith(loading: false, errorMessage: ""));
    }
  }
}