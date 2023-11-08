// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
// import 'package:project_2/cart/cart_screen/cart.dart';
import 'package:project_2/cart/screen/cart.dart';
import 'package:project_2/login_register/login.dart';
import 'package:project_2/myhomepage/pages/handcraft/cookies/cookies_page.dart';
import 'package:project_2/myhomepage/pages/handcraft/cookies/cookies_page_details.dart';
import 'package:project_2/myhomepage/pages/handcraft/drinks/drinks_page.dart';
import 'package:project_2/myhomepage/pages/handcraft/drinks/drinks_page_details.dart';
import 'package:project_2/myhomepage/pages/handcraft/snacks/snacks_page.dart';
import 'package:project_2/myhomepage/pages/handcraft/snacks/snacks_page_details.dart';
import 'package:project_2/myhomepage/pages/home_page/home_page.dart';
import 'package:project_2/myhomepage/pages/home_page/latest_offerings/offerings_details_page.dart';
import 'package:project_2/myhomepage/pages/home_page/populars/popular_details_page.dart';
import 'package:project_2/newfeature/payments.dart';
import 'package:project_2/payments/payment_app.dart';
import 'package:project_2/splashscreen/splash_screen.dart';
import 'package:project_2/splashscreen/starting_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case '/cart':
        return MaterialPageRoute(builder: (_) => Cart());

      case '/startscreen':
        return MaterialPageRoute(builder: (_) => StartingScreen());
      case '/home':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/login':
        return MaterialPageRoute(builder: (_) => Login());
      case '/payment':
        return MaterialPageRoute(builder: (_) => Payments());
      case '/snacks':
        return MaterialPageRoute(builder: (_) => SnacksPage());
      case '/drinks':
        return MaterialPageRoute(builder: (_) => DrinksPage());
      case '/cookies':
        return MaterialPageRoute(builder: (_) => CookiesPage());
      case '/cookiesdetails':
        return MaterialPageRoute(
            builder: (_) => CookiesPageDetails(
                  detail: args,
                ));
      case '/drinksdetails':
        return MaterialPageRoute(
            builder: (_) => DrinksPageDetails(
                  detail: args,
                ));
      case '/snacksdetails':
        return MaterialPageRoute(
            builder: (_) => SnacksDetailsPage(
                  detail: args,
                ));
      case '/offerspage':
        return MaterialPageRoute(
            builder: (_) => OfferingsDetailsPage(
                  offer: args,
                ));
      case '/popularspage':
        return MaterialPageRoute(
            builder: (_) => PopularDetailsPage(
                  popular: args,
                ));
    }
    throw AboutListTile();
  }
}
