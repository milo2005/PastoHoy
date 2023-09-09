import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData light() => ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
        colorScheme: const ColorScheme.dark(
          background: Color.fromARGB(0xff, 0x20, 0x22, 0x2c),
          primary: Color.fromARGB(0xff, 0x43, 0x9a, 0x63),
          secondary: Color.fromARGB(0xff, 0x10, 0x7c, 0x83),
          onPrimary: Color.fromARGB(0xff, 0xff, 0xff, 0xff),
          onSecondary: Color.fromARGB(0xff, 0xf6, 0xf6, 0xf6),
          surface: Color.fromARGB(0xff, 0x3b, 0x47, 0x58),

        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(0xff, 0x43, 0x9a, 0x63),
            foregroundColor: const Color.fromARGB(0xff, 0xff, 0xff, 0xff),
          ),
        ),
    inputDecorationTheme: const InputDecorationTheme(
      fillColor: Color.fromARGB(0xff, 0x36, 0x3A, 0x49),
      filled: true,
      enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(0xff, 0x19, 0x1a, 0x22))),
      // border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(16))),

    )
      );

  static ThemeData dark() => ThemeData();
}
