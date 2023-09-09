import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pasto_hoy/di/app_injector.dart';
import 'package:pasto_hoy/presentation/login/login_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pasto_hoy/presentation/login/login_state.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final typo = Theme.of(context).textTheme;

    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset("assets/images/pasto_bg.png"),
              Positioned(
                left: 0,
                top: 0,
                right: 0,
                bottom: 0,
                child: Center(
                  child: Text(
                    "Pasto Hoy",
                    style: typo.displayLarge,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: LoginPageContent(),
            ),
          )
        ],
      ),
    );
  }
}

class LoginPageContent extends StatefulWidget {
  const LoginPageContent({super.key});

  @override
  State<LoginPageContent> createState() => _LoginPageContentState();
}

class _LoginPageContentState extends State<LoginPageContent> {
  late LoginBloc _bloc;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    _bloc = getIt();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState> (
      bloc: _bloc,
      builder: (ctx, state) {
        return Column(
          children: [
            TextFormField(
              controller: _emailController,
              enabled: !state.isLoading,
            ),
            const SizedBox(height: 12),
            TextFormField(
              obscureText: true,
              controller: _passwordController,
              enabled: !state.isLoading,
            ),
            if(state.error != null)
              Text("Error al iniciar Session"),
            if(state.isLoading)
              CircularProgressIndicator(),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {},
                    child: Text("Registrate"),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      final email = _emailController.value.text;
                      final password = _passwordController.value.text;
                      _bloc.login(email, password);
                    },
                    child: Text("Entrar"),
                  ),
                ),
              ],
            )
          ],
        );
      },
      listener: (context, state){
          if(state.success == true) {
            context.pushReplacement("/home");
          }
      },
    );
  }
}
