import 'package:flutter/material.dart';
import 'package:project_2/constants/genietheme_constant.dart';

class GenieTheme {
  static final darkTheme = ThemeData(
      scaffoldBackgroundColor: darkthemebgcolor, appBarTheme: const AppBarTheme());

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: lightthemebgcolor,
    // scaffoldBackgroundColor: Color.fromARGB(255, 206, 191, 186),
    appBarTheme:  AppBarTheme(
      color: appbarthemecolor,
    ),
  );
}
