// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_2/cart/screen/Extras.dart';

import 'package:project_2/cart/widget/Tip.dart';

import '../../myhomepage/widgets/appbar_widget.dart';
import '../button/Button.dart';
import '../riverpod/state_provider.dart';
import '../widget/Instruction_card.dart';
import '../widget/cart_item.dart';
import 'empty_cart.dart';

class Cart extends ConsumerStatefulWidget {
  @override
  ConsumerState<Cart> createState() => _CartState();
}

class _CartState extends ConsumerState<Cart> {
  double tipfee = 0.0;
  @override
  Widget build(BuildContext context) {
    final data = ref.watch(CartProvider);

    final tc = data.length != 0
        ? data.map((e) => e["cost"] * e["quantity"]).toList()
        : [];

    final subt =
        tc.length != 0 ? tc.reduce((value, element) => value + element) : 0;

    return Scaffold(
        // backgroundColor: Colors.grey[100],
        appBar: AppbarWidget(),
        body: (subt == 0 || data.length == 0)
            ? EmptyCart()
            : Column(
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
                                    return CartItem(data: data[index]);
                                  }
                                  return Container(
                                    height: 0,
                                  );
                                } else if (index == data.length + 1) {
                                  return Tip(addtip: (value) {
                                    print(value);
                                    setState(() {
                                      tipfee = value;
                                    });
                                  });
                                } else if (index == data.length) {
                                  // return Delievery_Instruction();
                                  return InstructionCard();
                                } else if (index == data.length + 2) {
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
                                              fontSize: 18,
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
                  Button(
                    subtotal: subt,
                    tip: tipfee,
                  )
                ],
              ));
  }
}
