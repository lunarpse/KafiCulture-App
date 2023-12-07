// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

import '../constants/appbar_constants.dart';



class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppbarWidget({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      flexibleSpace: Image.asset(
        "assets/images/appbarbg4.jpg",
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
              backgroundColor:circleavatarbgcolor,
              backgroundImage: AssetImage("assets/images/logo1.png"),
              radius: 18,
            ),
            SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                apptitle,
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  appslogan,
                  style: TextStyle(
                      fontFamily: 'Ephesis', fontSize: 18, letterSpacing: 1),
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
          color:carticonbuttoncolor,
          iconSize: 25,
        ),
      ],
    );
  }
}
