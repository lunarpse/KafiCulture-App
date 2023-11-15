// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../../../appbar/appbar_widget.dart';
import '../../../reusable_widgets/detailsPage_widget.dart';

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
