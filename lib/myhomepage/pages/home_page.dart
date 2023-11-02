// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project_2/myhomepage/pages/homeWidget.dart';
import 'package:project_2/values/homepage/categories.dart';
import 'package:project_2/values/homepage/offers.dart';
import 'package:project_2/values/homepage/populars.dart';
import '../widgets/appbar_widget.dart';
import '../widgets/categories_widget.dart';
import '../widgets/offerings_widget.dart';
import '../widgets/popular_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(),
      body: ListView(
        padding: EdgeInsets.only(left: 5, right: 5, bottom: 10),
        children: [
          //---------------->Latest Offerings
          Padding(
              padding: EdgeInsets.only(top: 10, left: 5),
              child: HomeHeading(
                  headingText: heading1,
                  headingText_fontSize: heading1_fontSize)),

          //---------------->Latest Offerings widget
          OfferingsWidget(),

          //---------------->Categories
          Padding(
              padding: EdgeInsets.only(top: 10, left: 5),
              child: HomeHeading(
                  headingText: heading2,
                  headingText_fontSize: heading2_fontSize)),

          //---------------->Categories widget
          Categories(),

          // ---------------------------->Popular
          Padding(
              padding: EdgeInsets.only(top: 10, left: 5),
              child: HomeHeading(
                  headingText: heading3,
                  headingText_fontSize: heading3_fontSize)),

          //-------------------------->popular widget
          PopularWidget(),
        ],
      ),
    );
  }
}
