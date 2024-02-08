// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:project_2/cart/widget/extraitems.dart';
import 'package:project_2/constants/text_constants.dart';
// import 'package:project_2/hjc/cart_widget/extraitems.dart';

class Extras extends ConsumerWidget {
  Extras({super.key, required this.coffee});
  final coffee;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final a = [
      ExtraItems(
          name: extraItemMtapName1,
          image: extraItemMtapimage1,
          price: extraItemMtapPrice1),
      ExtraItems(
          name: extraItemMtapName2,
          image: extraItemMtapimage2,
          price: extraItemMtapPrice2),
      ExtraItems(
          name: extraItemMtapName3,
          image: extraItemMtapimage3,
          price: extraItemMtapPrice3)
    ];
    final b = [
      ExtraItems(
          coffee: false,
          price: extraItemCargoPrice1,
          image: extraItemCargoimage1,
          name: extraItemCargoName1),
      ExtraItems(
          coffee: false,
          price: extraItemCargoPrice2,
          image: extraItemCargoimage2,
          name: extraItemCargoName2),
      ExtraItems(
          coffee: false,
          price: extraItemCargoPrice3,
          image: extraItemCargoimage3,
          name: extraItemCargoName3)
    ];
    return Container(
        margin: EdgeInsets.all(2),
        decoration: BoxDecoration(
            // color: Color.fromARGB(255, 240, 70, 58),
            borderRadius: BorderRadius.circular(5)),
        height: 170,
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          children: coffee == true ? a : b,
        ));
  }
}
