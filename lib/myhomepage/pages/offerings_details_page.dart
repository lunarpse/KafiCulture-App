// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../widgets/appbar_widget.dart';
import '../widgets/detailsPage_widget.dart';

class OfferingsDetailsPage extends StatelessWidget {
  const OfferingsDetailsPage({super.key, required this.offer});

  final offer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(),
      body: DetailsPageWidget(details: offer),
    );
  }
}
