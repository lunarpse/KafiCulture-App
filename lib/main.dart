// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:project_2/genieTheme/genie_theme.dart';
import 'package:project_2/login_register/login.dart';
import 'package:project_2/myhomepage/pages/handcraft/cookies/cookies_page.dart';
import 'package:project_2/myhomepage/pages/handcraft/cookies/cookies_page_details.dart';
import 'package:project_2/myhomepage/pages/handcraft/drinks/drinks_page.dart';
import 'package:project_2/myhomepage/pages/handcraft/snacks/snacks_page.dart';
import 'package:project_2/myhomepage/pages/home_page/home_page.dart';

import 'package:project_2/payments/payment_app.dart';
import 'package:project_2/router/genie_router.dart';
import 'package:project_2/router/routing.dart';
import 'package:project_2/splashscreen/splash_screen.dart';
import 'package:project_2/splashscreen/starting_screen.dart';

void main() {
  runApp(
    ProviderScope(
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  void initState() {
    super.initState();
    // Routes.defineRoutes();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
//       routes: {
//         "/": (context) => SplashScreen(),
//         "/startscreen": (context) => StartingScreen(),
//         "/home": (context) => HomePage(),
//         "/login": (context) => Login(),
//         "/payment": (context) => PaymentApp(),
//         "/SnacksPage": (context) => SnacksPage(),
//         "/DrinksPage": (context) => DrinksPage(),
//         "/CookiesPage": (context) => CookiesPage(),
//  "/cookiesdetails":(context)=>CookiesPageDetails(detail: null,),
//  "/":(context)=>SplashScreen(),
      // },
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: GenieTheme.lightTheme,
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //   useMaterial3: true,
      // ),
      // home: SplashScreen(),
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
