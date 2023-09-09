import 'package:flutter/material.dart';
import 'package:pasto_hoy/di/app_injector.dart';
import 'package:pasto_hoy/presentation/pages/login/login_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginBloc _bloc;

  @override
  void initState() {
    _bloc = getIt<LoginBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(

              child: Image(image: AssetImage("assets/images/pasto_bg.png"),)
            ),
            TextFormField(),
            TextFormField(),
            Card(

              child: Text("Hola"),
            ),
            Row(children: [
              TextButton(onPressed: ()=>{}, child: Text("Registrate")),
              ElevatedButton(onPressed: ()=>{}, child: Text("Login")),
            ],)

          ],
        ),
      ),
    );
  }
}
