// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_2/appbar/appbar_widget.dart';
import 'package:project_2/cart/riverpod/cargo_state_provider.dart';
import 'package:project_2/cart/riverpod/switch_provider.dart';
import 'package:project_2/cart/riverpod/tipstate_provider.dart';
import 'package:project_2/cart/screen/Extras.dart';
import 'package:project_2/cart/widget/Bottom.dart';
import 'package:project_2/cart/widget/Cooking_Instructions.dart';
import 'package:project_2/customdrawer/drawerScreen.dart';

import '../../homepage/reusable_widgets/background_container_widget.dart';
import '../riverpod/state_provider.dart';

import '../widget/cart_item.dart';

import 'empty_cart.dart';

class Cart extends ConsumerStatefulWidget {
  const Cart({super.key});

  @override
  ConsumerState<Cart> createState() => _CartState();
}

class _CartState extends ConsumerState<Cart> {
  var pop = false;

  @override
  Widget build(BuildContext context) {
    final data = ref.watch(SwitchProvider) == false
        ? ref.watch(CargoProvider)
        : ref.watch(CartProvider);

    final tipfee = ref.watch(TipProvider)["tip"];

    final tc = data.length != 0
        ? data.map((e) => e["price"] * e["quantity"]).toList()
        : [];

    final subt =
        tc.length != 0 ? tc.reduce((value, element) => value + element) : 0;
    final gst = subt * 0.05;

    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
          // backgroundColor: Colors.grey[100],
          appBar: AppbarWidget(
            incart: true,
          ),
          drawer: DrawerScreen(),
          resizeToAvoidBottomInset: false,
          body: (subt == 0 || data.length == 0)
              //empty cart page
              ? BackgroundContainerWidget(
                  opacity: 0.6, x: 8.0, y: 8.0, child: EmptyCart())
              //cart page
              : BackgroundContainerWidget(
                  opacity: 0.5,
                  x: 7.0,
                  y: 7.0,
                  child: Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(),
                              ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: data.length + 3,
                                  padding: EdgeInsets.all(8),
                                  itemBuilder: (context, index) {
                                    if (index < data.length) {
                                      if (data[index]["quantity"] != 0) {
                                        return CartItem(
                                            key: GlobalObjectKey(data[index]),
                                            data: data[index]);
                                      }
                                      return Container(
                                        height: 0,
                                      );
                                    } else if (index == data.length) {
                                      return ref.watch(SwitchProvider) == true
                                          ? CookingInstructions()
                                          : SizedBox();
                                    } else if (index == data.length + 1) {
                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 3),
                                            child: Text(
                                              "Populars",
                                              style: TextStyle(
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Extras(),
                                        ],
                                      );
                                      // return Extras();
                                    }
                                  }),
                            ],
                          ),
                        ),
                      ),
                      //total cost review widget
                      Bottom(
                        gst: gst,
                        subtotal: subt,
                        tip: tipfee,
                      )
                    ],
                  ),
                )),
    );
  }
}
