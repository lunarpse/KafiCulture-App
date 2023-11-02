// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_2/genieTheme/genie_theme.dart';
import 'package:project_2/myhomepage/newpages/new_detailsPage_widget.dart';
import 'package:project_2/myhomepage/newpages/new_home.dart';
import 'package:project_2/payments/payment_app.dart';
import 'package:project_2/splashscreen/splash_screen.dart';

import 'myhomepage/pages/home_page.dart';

void main() {
  runApp(
    ProviderScope(
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: GenieTheme.lightTheme,
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //   useMaterial3: true,
      // ),
      home: const SplashScreen(),
    );
  }
}
