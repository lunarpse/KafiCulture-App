// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project_2/customdrawer/drawerScreen.dart';

import '../../../../appbar/appbar_widget.dart';
import '../../../reusable_widgets/detailsPage_widget.dart';

class OfferingsDetailsPage extends StatelessWidget {
  const OfferingsDetailsPage({super.key, required this.offer});

  final offer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(),
      drawer: DrawerScreen(),
      body: DetailsPageWidget(details: offer),
    );
  }
}
