// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project_2/customdrawer/drawerScreen.dart';

import '../../../../appbar/appbar_widget.dart';
import '../../../reusable_widgets/detailsPage_widget.dart';

class SnacksDetailsPage extends StatelessWidget {
  const SnacksDetailsPage({super.key, required this.detail});

  final detail;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(),
      drawer: DrawerScreen(),
      body: DetailsPageWidget(details: detail),
    );
  }
}
