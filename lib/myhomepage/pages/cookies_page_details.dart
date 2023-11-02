// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../widgets/appbar_widget.dart';
import '../widgets/detailsPage_widget.dart';

class CookiesPageDetails extends StatelessWidget {
  const CookiesPageDetails({super.key, required this.detail});

  final detail;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(),
      body: DetailsPageWidget(details: detail),
    );
  }
}
