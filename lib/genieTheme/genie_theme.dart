import 'package:flutter/material.dart';

class GenieTheme {
  static final darkTheme = ThemeData(
      scaffoldBackgroundColor: Colors.black,
      appBarTheme: const AppBarTheme(
        color: Colors.white,
      ));

  static final lightTheme = ThemeData(
      scaffoldBackgroundColor: Color.fromARGB(255, 235, 228, 215),
      appBarTheme: const AppBarTheme(
        color: Color.fromARGB(255, 224, 224, 219),
      ));
}
