// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_2/cart/riverpod/cargo_state_provider.dart';

import 'package:project_2/cart/widget/Remove_or_Cancel.dart';
import 'package:project_2/constants/color_constants.dart';
import 'package:project_2/constants/text_constants.dart';
import '../riverpod/state_provider.dart';

class CartItem extends ConsumerStatefulWidget {
  final data;
  final atpayment;
  final coffee;

  const CartItem({
    required this.coffee,
    super.key,
    required this.data,
    this.atpayment = false,
  });

  @override
  ConsumerState createState() => _MyWidgetState();
}

class _MyWidgetState extends ConsumerState<CartItem> {
  var _showremove = false;
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double amount = widget.data["cost"];
    final amount2 = double.parse(amount.toStringAsFixed(2));

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 8),
      child: _showremove == true
          ? RemoveOrCancel(
              image: widget.data["icon"],
              name: widget.data["name"],
              setremove: () {
                setState(() {
                  _showremove = false;
                });
              })
          : Container(
              padding: EdgeInsets.all(8),
              width: double.infinity,
              height: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  // color: Color.fromARGB(
                  //     255, 17, 16, 16), // Color.fromARGB(255, 247, 235, 231),
                  gradient: LinearGradient(colors: [
                    cartLinearGrad1,
                    cartLinearGrad2,
                    cartLinearGrad3
                  ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                  boxShadow: [
                    BoxShadow(
                      color: cartboxshadow1,
                      spreadRadius: 0.5,
                      blurRadius: 1,
                      offset: Offset(0, 3),
                    )
                  ]),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 105,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(widget.data["icon"]),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: cartboxshadow2,
                            offset: Offset(0, 2),
                            blurRadius: 2,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: SizedBox(
                        // color: Colors.green,
                        width: 97,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.data["name"],
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: cartbuttoncolor,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              widget.atpayment
                                  ? widget.data["price"].toString()
                                  : "\$ $amount2",
                              style: TextStyle(
                                color: cartbuttoncolor,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    //         showremove
                    // //             ? remove
                    SizedBox(
                      width: 10,
                    ),
                    widget.atpayment
                        ? Expanded(
                            child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    quantity,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "${widget.data["quantity"]}",
                                    style: TextStyle(fontSize: 15),
                                  )
                                ],
                              ),
                            ),
                          )
                        : Container(
                            child: Row(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 30,
                                    width: 35,
                                    decoration: BoxDecoration(
                                        //   color: Color.fromARGB(255, 19, 18, 18),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(50))),
                                    child: IconButton(
                                        mouseCursor: SystemMouseCursors.click,
                                        color: carticonbutton,
                                        onPressed: () {
                                          if (widget.data["quantity"] == 1) {
                                            setState(() {
                                              _showremove = true;
                                            });
                                          } else {
                                            widget.coffee == true
                                                ? ref
                                                    .watch(
                                                        CartProvider.notifier)
                                                    .decrease_quantity(
                                                        widget.data["name"])
                                                : ref
                                                    .watch(
                                                        CargoProvider.notifier)
                                                    .decrease_quantity(
                                                        widget.data["name"]);
                                            ;
                                          }
                                        },
                                        icon: Icon(
                                          Icons.remove,
                                          size: 22,
                                        )),
                                  ),
                                  Container(
                                    //  color: Colors.red,
                                    height: 30,
                                    padding: EdgeInsets.fromLTRB(8, 6.8, 8, 0),
                                    child: Text(
                                      widget.data["quantity"].toString(),
                                      style: TextStyle(
                                          color: cartbuttoncolor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 35,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(50))),
                                    child: IconButton(
                                        color: carticonbutton,
                                        onPressed: () {
                                          widget.coffee == true
                                              ? ref
                                                  .watch(CartProvider.notifier)
                                                  .increase_quantity(
                                                      widget.data["name"])
                                              : ref
                                                  .watch(CargoProvider.notifier)
                                                  .increase_quantity(
                                                      widget.data["name"], 1);
                                        },
                                        icon: Icon(
                                          Icons.add,
                                          size: 22,
                                        )),
                                  ),
                                ],
                              ),

                              IconButton(
                                  onPressed: () {
                                    widget.coffee == true
                                        ? ref
                                            .watch(CartProvider.notifier)
                                            .remove_item(widget.data["name"])
                                        : ref
                                            .read(CargoProvider.notifier)
                                            .remove_item(widget.data["name"]);
                                  },
                                  icon: Icon(
                                    color: cartdeletebutton,
                                    Icons.delete,
                                    size: 28,
                                  ))
                              // showremove
                              //     ? remove
                            ],
                          )),
                  ]),
            ),
    );
  }
}
