// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class BackgroundContainerWidget extends StatelessWidget {
  const BackgroundContainerWidget({super.key, this.child});

  final child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/bg3.jpg'),
          fit: BoxFit.fill,
          colorFilter: ColorFilter.mode(Colors.white, BlendMode.softLight),
        ),
      ),
      child: child,
    );
  }
}
