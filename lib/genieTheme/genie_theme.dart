import 'package:flutter/material.dart';

class GenieTheme {
  static final darkTheme = ThemeData(
      scaffoldBackgroundColor: Colors.black, appBarTheme: const AppBarTheme());

  static final lightTheme = ThemeData(
    // scaffoldBackgroundColor: Color.fromARGB(255, 235, 228, 215),
    // scaffoldBackgroundColor: Color.fromARGB(255, 206, 191, 186),
    appBarTheme: const AppBarTheme(
      color: Color.fromARGB(255, 134, 89, 22),
    ),
  );
}
