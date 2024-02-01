// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ui';
import 'package:flutter/material.dart';
// import 'package:project_2/constants/color_constants.dart';

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
    return Scaffold(
      // backgroundColor: Color.fromRGBO(16, 16, 16, 1),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 20, 20, 20),
            // Colors.grey.shade900,
            Color.fromARGB(255, 39, 39, 39).withOpacity(0.9),
            Color.fromARGB(255, 161, 161, 161),
            Color.fromARGB(255, 39, 39, 39).withOpacity(0.9),
            Color.fromARGB(255, 20, 20, 20),
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: x, sigmaY: y),
          child: child,
        ),
      ),
    );
  }
}
