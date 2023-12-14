// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project_2/homepage/bloc/home_bloc.dart';
import 'package:project_2/homepage/constant_homepage/constant_categories.dart';

class HandCraftedWidget extends StatelessWidget {
  const HandCraftedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeBloc homeBloc = HomeBloc();
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
              // Navigator.pushNamed(context, '/snacks');
              homeBloc.add(HomeCurationsNavigateEvent());
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
