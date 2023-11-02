import 'package:flutter/material.dart';
import 'package:project_2/values/homepage/offers.dart';

class HomeHeading extends StatelessWidget {
  const HomeHeading(
      {super.key,
      required this.headingText,
      required this.headingText_fontSize});
  final String headingText;
  final double headingText_fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      headingText,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: headingText_fontSize,
      ),
    );
  }
}
