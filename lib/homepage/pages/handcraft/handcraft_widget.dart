// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project_2/constants/color_constants.dart';
import 'package:project_2/constants/text_constants.dart';
import 'package:project_2/homepage/constant_homepage/constant_categories.dart';



class HandCraftedWidget extends StatelessWidget {
  const HandCraftedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(padding_edge),
      child: GridView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount:gridView_crossAxisCount,
          crossAxisSpacing: griddView_crossAxisSpacing,
        ),
        children: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/snacks');
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
                        color: handcraftboxShadowcolor,
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
                  snacks,
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/drinks');
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
                        color: handcraftboxShadowcolor
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
                  drinks,
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/cookies');
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
                        color: handcraftboxShadowcolor
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
                  cookies,
                  style: TextStyle(
                      fontSize: 17,
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
