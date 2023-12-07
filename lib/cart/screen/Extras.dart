// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project_2/cart/widget/extraitems.dart';

import '../../constants/extras_constants.dart';
// import 'package:project_2/hjc/cart_widget/extraitems.dart';

class Extras extends StatelessWidget {
  const Extras({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(2),
        decoration: BoxDecoration(
            // color: Color.fromARGB(255, 240, 70, 58),
            borderRadius: BorderRadius.circular(5)),
        height: 170,
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          children: [
            ExtraItems(
                name: extraitem1,
                image: "assets/images/hot_choc.jpg",
                price: 12),
            ExtraItems(
                name: extraitem2,
                image: "assets/images/Aloo_snacks.jpg",
                price: 23),
            ExtraItems(
                name: extraitem3,
                image: "assets/images/Dahi_Vada.jpg",
                price: 40)
          ],
        ));
  }
}
