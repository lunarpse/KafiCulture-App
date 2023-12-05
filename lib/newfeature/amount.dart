import 'package:flutter/material.dart';

class Amount extends StatelessWidget {
  const Amount(
      {super.key,
      required this.text,
      required this.price,
      required this.fontSize,
      required this.fontColor,
      required this.leftPadding,
      required this.rightPadding,
      required this.topPadding,
      required this.bottomPadding});

  final String text;
  final String price;
  final double fontSize;
  final Color fontColor;
  final double leftPadding;
  final double rightPadding;
  final double topPadding;
  final double bottomPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: leftPadding,
          right: rightPadding,
          top: topPadding,
          bottom: bottomPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.w400,
              color: fontColor,
            ),
          ),
          Text(price,
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.w400,
                color: fontColor,
              )),
        ],
      ),
    );
  }
}
