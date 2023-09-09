import 'package:injectable/injectable.dart';
import 'package:pasto_hoy/domain/login/exceptions/login_exceptions.dart';
import 'package:pasto_hoy/domain/login/models/credential.dart';
import 'package:pasto_hoy/domain/util/async_result.dart';
import 'package:pasto_hoy/presentation/login/login_state.dart';
import 'package:bloc/bloc.dart';

import '../../domain/login/usecases/login_use_case.dart';

@injectable
class LoginBloc extends Cubit<LoginState>{

  final LoginUseCase _loginUseCase;
  LoginBloc(this._loginUseCase):super(LoginState(isLoading: false));

  login(String email, String password) async {
    emit(state.copyWith(isLoading: true, error: null));
    final result = await _loginUseCase(Credentials(email: email, password: password));

    switch(result){
      case Success<Empty, LoginExceptions>():
        emit(state.copyWith(isLoading:false, success: true));

      case Failure<Empty, LoginExceptions>():
        emit(state.copyWith(isLoading:false, error: result.exception));
    }
  }
}