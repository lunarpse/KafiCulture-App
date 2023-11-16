// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project_2/homepage/pages/home_page/home_headings.dart';
import 'package:project_2/homepage/constant_homepage/constant_categories.dart';
import 'package:project_2/homepage/constant_homepage/constant_offers.dart';
import 'package:project_2/homepage/constant_homepage/constant_populars.dart';
import 'package:project_2/homepage/reusable_widgets/drawer.dart';
import '../../../appbar/appbar_widget.dart';
import '../../reusable_widgets/background_container_widget.dart';
import '../../widgets/offerings_widget.dart';
import '../../widgets/popular_widget.dart';
import '../handcraft/handcraft_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(),
      body: BackgroundContainerWidget(
        child: ListView(
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
            HandCraftedWidget(),

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
      ),
      drawer: drawerScreen(),
    );
  }
}
