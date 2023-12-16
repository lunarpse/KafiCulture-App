// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_2/cart/widget/Remove_or_Cancel.dart';
import 'package:project_2/constants/color_constants.dart';
import 'package:project_2/constants/text_constants.dart';
// import 'package:project_2/cart/cart/widget/Remove_or_Cancel.dart';

import '../riverpod/state_provider.dart';

class CartItem extends ConsumerStatefulWidget {
  final data;
  final atpayment;
  const CartItem({super.key, required this.data, this.atpayment = false});

  @override
  ConsumerState createState() => _MyWidgetState();
}

class _MyWidgetState extends ConsumerState<CartItem> {
  var _showremove = false;

  @override
  Widget build(BuildContext context) {
    double amount = widget.data["price"] * widget.data["quantity"];
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
                  color: cartboxdecorationcolor,
                  boxShadow: [
                    BoxShadow(
                      color: cartboxshadowcolor,
                      spreadRadius: 3,
                      blurRadius: 3,
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
                          color: cartboxshadow,
                          offset: Offset(0, 2),
                          blurRadius: 4,
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
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            widget.atpayment
                                ? widget.data["price"].toString()
                                : "\$ $amount2",
                            style: TextStyle(
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
                                  cartquantity,
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
                                  width: 30,
                                  decoration: BoxDecoration(
                                      color: cartboxdecorationcolor1,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(50))),
                                  child: IconButton(
                                      mouseCursor: SystemMouseCursors.click,
                                      color: cartmousecursorcolor,
                                      onPressed: () {
                                        if (widget.data["quantity"] == 1) {
                                          setState(() {
                                            _showremove = true;
                                          });
                                        } else {
                                          ref
                                              .read(CartProvider.notifier)
                                              .decrease_quantity(
                                                  widget.data["name"]);
                                        }
                                      },
                                      icon: Icon(
                                        Icons.remove,
                                        size: 15,
                                      )),
                                ),
                                Container(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    widget.data["quantity"].toString(),
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                      color: cartboxdecorationcolor2,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(50))),
                                  child: IconButton(
                                      color: cartbuttoncolor,
                                      onPressed: () {
                                        ref
                                            .read(CartProvider.notifier)
                                            .increase_quantity(
                                                widget.data["name"]);
                                      },
                                      icon: Icon(
                                        Icons.add,
                                        size: 15,
                                      )),
                                ),
                              ],
                            ),

                            IconButton(
                                onPressed: () {
                                  ref
                                      .watch(CartProvider.notifier)
                                      .remove_item(widget.data["name"]);
                                },
                                icon: Icon(
                                  Icons.delete,
                                  size: 28,
                                ))
                            // showremove
                            //     ? remove
                          ],
                        ))
                ],
              ),
            ),
    );
  }
}
