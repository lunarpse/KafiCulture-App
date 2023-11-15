import 'package:flutter/material.dart';

class UpiIcon extends StatelessWidget {
  const UpiIcon(
      {super.key,
      required this.height,
      required this.width,
      required this.assets});

  final double height;
  final double width;
  final String assets;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacementNamed(context, "/loading");
      },
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(shape: BoxShape.circle),
        child: Image.asset(assets),
      ),
    );
  }
}
