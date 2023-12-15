// ignore_for_file: prefer_typing_uninitialized_variables, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_2/cart/riverpod/cargo_state_provider.dart';

import 'package:project_2/cart/riverpod/state_provider.dart';
import 'package:project_2/cart/riverpod/switch_provider.dart';
import 'package:project_2/constants/color_constants.dart';
import 'package:project_2/constants/text_constants.dart';

class ExtraItems extends ConsumerWidget {
  const ExtraItems(
      {required this.price,
      super.key,
      required this.image,
      required this.name});
  final image;
  final name;
  final price;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var show = ref.watch(SwitchProvider);
    return Card(
      // elevation: 0,
      color: extraitemcardcolor,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Container(
          padding: const EdgeInsets.all(8.0),
          height: 110,
          width: 280,
          margin: EdgeInsets.symmetric(horizontal: 2),
          decoration: BoxDecoration(
              color: extraitemcardboxdecolor,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: extraitemcardboxshadowcolor,
                  spreadRadius: 3,
                  blurRadius: 3,
                  offset: Offset(0, 3),
                )
              ]),
          child: Row(
            children: [
              Container(
                width: 115,
                height: 120,
                decoration: BoxDecoration(
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
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                    ),
                    Text(
                      extraslogan,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
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
                              show == true
                                  ? ref.watch(CartProvider.notifier).additem({
                                      "name": name,
                                      "image": image,
                                      "price": price,
                                      "quantity": 1
                                    })
                                  : ref.watch(CargoProvider.notifier).additem({
                                      "name": name,
                                      "image": image,
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
