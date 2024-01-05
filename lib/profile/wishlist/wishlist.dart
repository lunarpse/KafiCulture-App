// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import '../../appbar/appbar_widget.dart';
import '../../customdrawer/drawerScreen.dart';
import '../reusable_widget/comming_soon_widget.dart';

class Wishlist extends StatelessWidget {
  const Wishlist({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(),
      drawer: DrawerScreen(),
      body: CommingSoonWidget(),
    );
  }
}
