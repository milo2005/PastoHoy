import 'package:flutter/material.dart';

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
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                TextFormField()
              ],
            ),
          )
        ],
      ),
    );
  }
}
