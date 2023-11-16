// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project_2/homepage/reusable_widgets/drawer.dart';

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppbarWidget({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      flexibleSpace: Image.asset(
        "assets/images/appbarbg2.jpg",
        fit: BoxFit.cover,
      ),
      title: GestureDetector(
        onTap: () {
          Navigator.pushReplacementNamed(context, "/home");
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: AssetImage("assets/images/logo1.png"),
              radius: 18,
            ),
            SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "KAFICULTURE",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  "Where every cup tells a story",
                  style: TextStyle(fontSize: 13),
                ),
              ],
            )
          ],
        ),
      ),
      leading: Builder(builder: (BuildContext context) {
        return IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: Icon(Icons.menu));
      }),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, "/cart");
          },
          icon: Icon(Icons.shopping_cart),
          color: Color.fromARGB(255, 201, 87, 62),
          iconSize: 25,
        ),
      ],
    );
  }
}
