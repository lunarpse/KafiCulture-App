// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../widgets/appbar_widget.dart';
import '../widgets/detailsPage_widget.dart';

class PopularDetailsPage extends StatelessWidget {
  const PopularDetailsPage({super.key, required this.popular});

  final popular;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(),
      body: DetailsPageWidget(details: popular),
    );
  }
}
