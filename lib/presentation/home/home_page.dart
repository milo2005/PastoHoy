import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final typo = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: Text("Home"),),
      body: Center(
        child: Text("Hola", style: typo.displayMedium,),
      ),
    );
  }
}
