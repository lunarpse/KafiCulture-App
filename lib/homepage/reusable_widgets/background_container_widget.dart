// ignore_for_file: prefer_const_constructors

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:project_2/constants/color_constants.dart';

class BackgroundContainerWidget extends StatelessWidget {
  const BackgroundContainerWidget(
      {super.key,
      this.child,
      required this.opacity,
      required this.x,
      required this.y});

  final child;
  final double opacity;
  final double x, y;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/bg7.jpg'),
          fit: BoxFit.fill,
          colorFilter: ColorFilter.mode(
              bgcontainercolor.withOpacity(opacity), BlendMode.dstATop),
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: x, sigmaY: y),
        child: child,
      ),
    );
  }
}
