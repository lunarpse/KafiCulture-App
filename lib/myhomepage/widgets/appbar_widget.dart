// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppbarWidget({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromRGBO(66, 24, 6, 1),
      // backgroundColor: Colors.transparent,
      title: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            backgroundImage: AssetImage("assets/images/logo1.png"),
            radius: 18,
          ),
          SizedBox(width: 8),
          Text(
            "Welcome, Guest",
            style: TextStyle(fontSize: 18),
          )
        ],
      ),
    );
  }
}
