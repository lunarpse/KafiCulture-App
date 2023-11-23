// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';

class BackgroundContainerWidget extends StatelessWidget {
  const BackgroundContainerWidget({super.key, this.child});

  final child;

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
              const Color.fromARGB(255, 248, 205, 189).withOpacity(0.4),
              BlendMode.dstATop),
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: child,
      ),
    );
  }
}
