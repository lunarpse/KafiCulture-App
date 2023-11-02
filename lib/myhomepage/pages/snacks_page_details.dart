// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../widgets/appbar_widget.dart';
import '../widgets/detailsPage_widget.dart';

class SnacksDetailsPage extends StatelessWidget {
  const SnacksDetailsPage({super.key, required this.detail});

  final detail;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(),
      body: DetailsPageWidget(details: detail),
    );
  }
}
