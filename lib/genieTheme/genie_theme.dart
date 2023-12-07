import 'package:flutter/material.dart';
import 'package:project_2/constants/color_constants.dart';


class GenieTheme {
  static final darkTheme = ThemeData(
      scaffoldBackgroundColor: geniedarkthemebgcolor, appBarTheme: const AppBarTheme());

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: genielightthemebgcolor,
    // scaffoldBackgroundColor: Color.fromARGB(255, 206, 191, 186),
    appBarTheme:  AppBarTheme(
      color: genieappbarthemecolor,
    ),
  );
}
