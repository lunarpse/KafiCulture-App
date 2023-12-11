// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';

import '../../constants/color_constants.dart';

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
        //     gradient: RadialGradient(colors: [
        //   Color.fromRGBO(255, 136, 102, 0.67),
        //   Color.fromRGBO(255, 221, 136, 0.28)
        // ])
        image: DecorationImage(
          image: AssetImage('assets/images/bg3.jpg'),
          fit: BoxFit.fill,
          colorFilter: ColorFilter.mode(
              // const Color.fromARGB(255, 248, 205, 189).withOpacity(0.4),
              bgcontainercolor.withOpacity(opacity),
              BlendMode.dstATop),
        ),
      ),
      child: BackdropFilter(
        // filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        filter: ImageFilter.blur(sigmaX: x, sigmaY: y),
        child: child,
      ),
    );
  }
}
