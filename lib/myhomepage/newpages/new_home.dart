import 'package:flutter/material.dart';
import 'package:project_2/custom_appbar/genie_appbar.dart';

import '../../values/homepage/categories.dart';
import '../../values/homepage/offers.dart';
import '../../values/homepage/populars.dart';

import '../pages/homeWidget.dart';
import '../widgets/categories_widget.dart';
import '../widgets/offerings_widget.dart';
import '../widgets/popular_widget.dart';

class NewHomePage extends StatelessWidget {
  const NewHomePage({super.key, this.name});

  final String? name;

  String? titleName() {
    if (name == null) {
      return "Guest";
    } else {
      return name;
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: CustomAppBar(
            child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
    )));
  }
}
