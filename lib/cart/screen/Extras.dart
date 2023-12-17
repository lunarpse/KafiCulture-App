// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_2/cart/riverpod/switch_provider.dart';
import 'package:project_2/cart/widget/extraitems.dart';
// import 'package:project_2/hjc/cart_widget/extraitems.dart';

class Extras extends ConsumerWidget {
  Extras({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final a = [
      ExtraItems(
          name: "Hot Chocolate",
          image: "assets/images/hot_choc.jpg",
          price: 12),
      ExtraItems(
          name: "Aloo Snacks",
          image: "assets/images/Aloo_snacks.jpg",
          price: 23),
      ExtraItems(
          name: "Dahi Vada", image: "assets/images/Dahi_Vada.jpg", price: 40)
    ];
    final b = [
      ExtraItems(
          price: 12,
          image: "assets/images/MenShoes/TESTONI SHOES.png",
          name: "Testoni"),
      ExtraItems(
          price: 23,
          image: "assets/images/MenShoes/MOLECULE SHOE.png",
          name: "Molecule"),
      ExtraItems(
          price: 20,
          image: "assets/images/MenShoes/NIKE AIR MAG 2016.png",
          name: "AIR jordans 2016")
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
          children: ref.watch(SwitchProvider) == true ? a : b,
        ));
  }
}
