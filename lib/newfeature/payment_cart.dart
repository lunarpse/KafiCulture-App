// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_2/cart/riverpod/state_provider.dart';
import 'package:project_2/cart/widget/Remove_or_Cancel.dart';
import 'package:project_2/constants/color_constants.dart';

import '../constants/text_constants.dart';
// import 'package:project_2/cart/cart/widget/Remove_or_Cancel.dart';

class PaymentCart extends ConsumerStatefulWidget {
  final data;
  final atpayment;
  const PaymentCart({super.key, required this.data, this.atpayment = false});

  @override
  ConsumerState createState() => _MyWidgetState();
}

class _MyWidgetState extends ConsumerState<PaymentCart> {
  var _showremove = false;

  @override
  Widget build(BuildContext context) {
    final addonprice =
        widget.data['addons'] == null ? 0 : widget.data['addons']['addonprice'];
    double amount = widget.data["cost"] + addonprice;
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
                height: 80,
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Color.fromARGB(255, 17, 17, 17),
                      Color.fromARGB(255, 39, 39, 41),
                      Color(0xFF4D4F52)
                    ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                    borderRadius: BorderRadius.circular(20),
                    color: paymentcartdeccolor,
                    boxShadow: [
                      BoxShadow(
                        color: paymentcartboxshadow,
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
                              color: paymentcartboxshadow,
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
                                // maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                "\$ $amount2",
                                style: TextStyle(
                                  color: Colors.white,
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
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "${widget.data["quantity"]}",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                      ),
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
                                          color: paymentcartdeccolor1,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(50))),
                                      child: IconButton(
                                          mouseCursor: SystemMouseCursors.click,
                                          color: paymenttextcolor,
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
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                          color: paymentcartdeccolor1,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(50))),
                                      child: IconButton(
                                          color: paymenttextcolor,
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
                    ])));
  }
}
