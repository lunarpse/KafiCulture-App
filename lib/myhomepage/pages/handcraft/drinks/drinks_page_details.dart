// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project_2/appbar/appbar_widget.dart';
import 'package:project_2/myhomepage/reusable_widgets/detailsPage_widget.dart';

class DrinksPageDetails extends StatelessWidget {
  const DrinksPageDetails({super.key, required this.detail});

  final detail;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(),
      body: DetailsPageWidget(details: detail),
    );
  }
}
