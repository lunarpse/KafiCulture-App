// ignore_for_file: prefer_typing_uninitialized_variables, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_2/cart/riverpod/cargo_state_provider.dart';

import 'package:project_2/cart/riverpod/state_provider.dart';

import 'package:project_2/constants/color_constants.dart';
import 'package:project_2/constants/text_constants.dart';

class ExtraItems extends ConsumerWidget {
  ExtraItems(
      {required this.price,
      super.key,
      required this.image,
      required this.name,
      this.coffee = true});
  final image;
  final coffee;
  final name;
  final price;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      // elevation: 0,
      color: extraitemcardcolor,
      child: Padding(
        padding: EdgeInsets.only(bottom: 3),
        child: Container(
          padding: EdgeInsets.all(8.0),
          height: 117,
          width: 280,
          margin: EdgeInsets.symmetric(horizontal: 2),
          decoration: BoxDecoration(
              //     color: extraitemcardboxdecolor,
              gradient:
                  LinearGradient(colors: [extraitemcolor1, extraitemcolor2]),
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: extraitemcardboxshadowcolor,
                  spreadRadius: 2,
                  blurRadius: 3,
                  offset: Offset(0, 3),
                )
              ]),
          child: Row(
            children: [
              Container(
                width: 113,
                height: 124,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: extraitemcolor3,
                        spreadRadius: 1.5,
                        blurRadius: 2),
                  ],
                  borderRadius: BorderRadius.circular(90),
                  image: DecorationImage(
                      fit: BoxFit.cover, image: AssetImage(image)),
                ),
              ),
              SizedBox(width: 15),
              Container(
                width: 125,
                // color: Colors.grey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                          color: cartbuttoncolor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    Text(
                      extraslogan,
                      maxLines: 2,
                      style: TextStyle(
                        color: cartbuttoncolor,
                        fontWeight: FontWeight.bold,
                        fontSize: 12.7,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\$ $price",
                          style: TextStyle(
                            fontSize: 17,
                            color: extraitempricetextcolor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: IconButton(
                            mouseCursor: SystemMouseCursors.grab,
                            onPressed: () {
                              coffee == true
                                  ? ref.watch(CartProvider.notifier).additem({
                                      "name": name,
                                      "image": image,
                                      "price": price,
                                      "cost": price,
                                      "quantity": 1
                                    })
                                  : ref.watch(CargoProvider.notifier).additem({
                                      "name": name,
                                      "image": image,
                                      "cost": price,
                                      "price": price,
                                      "quantity": 1
                                    });
                            },
                            icon: Icon(
                              Icons.shopping_cart_outlined,
                              color: extraitemshoppingcartoutlinecolor,
                              size: 25,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
