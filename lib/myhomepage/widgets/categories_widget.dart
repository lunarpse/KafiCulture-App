// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project_2/myhomepage/pages/cookies_page.dart';
import 'package:project_2/values/homepage/categories.dart';

import '../pages/drinks_page.dart';
import '../pages/snacks_page.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(padding_edge),
      child: GridView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: gridView_crossAxisCount,
          crossAxisSpacing: gridView_crossAxisSpacing,
        ),
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SnacksPage(),
                  ));
            },
            child: Column(
              children: [
                Expanded(
                  child: Container(
                      decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/snacks.jpg"),
                      fit: BoxFit.fill,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: boxShadow_color,
                        blurRadius: boxShadow_blurRadius,
                        spreadRadius: boxShadow_spreadRadius,
                        offset: Offset(boxShadow_offSet_startPoint,
                            boxShadow_offSet_endPoint),
                      )
                    ],
                    shape: BoxShape.circle,
                  )),
                ),
                Text(
                  categories1,
                  style: TextStyle(
                      fontSize: categories_fontSize,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DrinksPage(),
                  ));
            },
            child: Column(
              children: [
                Expanded(
                  child: Container(
                      decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/drinks.jpg"),
                      fit: BoxFit.fill,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: boxShadow_color
                            .withOpacity(boxShadow_color_opacity),
                        blurRadius: boxShadow_blurRadius,
                        spreadRadius: boxShadow_spreadRadius,
                        offset: Offset(boxShadow_offSet_startPoint,
                            boxShadow_offSet_endPoint),
                      )
                    ],
                    shape: BoxShape.circle,
                  )),
                ),
                Text(
                  categories2,
                  style: TextStyle(
                      fontSize: categories_fontSize,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CookiesPage(),
                  ));
            },
            child: Column(
              children: [
                Expanded(
                  child: Container(
                      decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/cookies.jpg"),
                      fit: BoxFit.fill,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: boxShadow_color
                            .withOpacity(boxShadow_color_opacity),
                        blurRadius: boxShadow_blurRadius,
                        spreadRadius: boxShadow_spreadRadius,
                        offset: Offset(boxShadow_offSet_startPoint,
                            boxShadow_offSet_endPoint),
                      )
                    ],
                    shape: BoxShape.circle,
                  )),
                ),
                Text(
                  categories3,
                  style: TextStyle(
                      fontSize: categories_fontSize,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
