// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:project_2/Cargo/men/men_shoes.dart';
import 'package:project_2/Cargo/women/ladies_bag.dart';
import 'package:project_2/Cargo/women/ladies_bag_details.dart';
import 'package:project_2/cart/screen/cart.dart';
import 'package:project_2/feedBack/FeedBack_page.dart';
import 'package:project_2/loading/loadingScreen.dart';

import 'package:project_2/homepage/pages/handcraft/cookies/cookies_page.dart';
import 'package:project_2/homepage/pages/handcraft/cookies/cookies_page_details.dart';
import 'package:project_2/homepage/pages/handcraft/drinks/drinks_page.dart';
import 'package:project_2/homepage/pages/handcraft/drinks/drinks_page_details.dart';
import 'package:project_2/homepage/pages/handcraft/snacks/snacks_page.dart';
import 'package:project_2/homepage/pages/handcraft/snacks/snacks_page_details.dart';
import 'package:project_2/homepage/pages/home_page/home_page.dart';
import 'package:project_2/homepage/pages/home_page/latest_offerings/offerings_details_page.dart';
import 'package:project_2/homepage/pages/home_page/populars/popular_details_page.dart';
import 'package:project_2/payments/payment_app.dart';
import 'package:project_2/splashscreen/splash_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case '/cart':
        return MaterialPageRoute(builder: (_) => Cart());

      case '/loading':
        return MaterialPageRoute(builder: (_) => LoadingScreen());
      case '/feedback':
        return MaterialPageRoute(builder: (_) => FeedBackPage());
      case '/home':
        return MaterialPageRoute(builder: (_) => HomePage());
      // case '/login':
      //   return MaterialPageRoute(builder: (_) => Login());
      case '/payment':
        return MaterialPageRoute(builder: (_) => PaymentApp());
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
      case '/shoespage':
        return MaterialPageRoute(builder: (_) => MenShoes());
      case '/bagpage':
        return MaterialPageRoute(builder: (_) => LadiesBag());
      case '/ladiesdetails':
        return MaterialPageRoute(
            builder: (_) => LadiesBagDetailsPage(
                  detail: args,
                ));
    }

    throw AboutListTile();
  }
}
