// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_2/cart/riverpod/tipstate_provider.dart';
import 'package:project_2/login_register/login.dart';

import 'charges.dart';

class Bottom extends ConsumerWidget {
  final double subtotal;
  final tip;
  final double gst;
  Bottom(
      {super.key,
      required this.gst,
      required this.subtotal,
      required this.tip});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // print("hhh $gst    $tip  ${double.parse(subtotal.toStringAsFixed(2))}");
    double total = tip +
        double.parse(gst.toStringAsFixed(2)) +
        double.parse(subtotal.toStringAsFixed(2));
    print("rr $tip");

    return Container(
      padding: const EdgeInsets.only(
        left: 14.0,
        right: 14,
        bottom: 8.0,
        top: 4.0,
      ),
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 218, 209, 207),
          boxShadow: [
            BoxShadow(
                color: Colors.black,
                offset: Offset(1, 1),
                spreadRadius: 2,
                blurRadius: 1)
          ],
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.receipt),
              SizedBox(
                width: 10,
              ),
              Text(
                "Bill Details",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
              ),
            ],
          ),
          Charges(
              name: "Subtotal",
              cost: double.parse(subtotal.toStringAsFixed(2))),
          //Charges(name: "Shipping Cost", cost: 10),
          Charges(name: "GST", cost: double.parse(gst.toStringAsFixed(2))),
          Charges(name: "Tip", cost: tip),
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
            child: Row(
              children: List.generate(
                  300 ~/ 5,
                  (index) => Expanded(
                        child: Container(
                          color: index % 2 == 0
                              ? Colors.transparent
                              : Colors.black,
                          height: 2,
                        ),
                      )),
            ),
          ),
          Charges(name: "Total", cost: double.parse(total.toStringAsFixed(2))),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 16.0,
                  ),
                  backgroundColor: Color.fromARGB(255, 110, 47, 24),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    side: BorderSide(
                      color: Colors.black38,
                    ),
                  ),
                ),
                onPressed: () {
                  ref
                      .watch(TipProvider.notifier)
                      .setgst(double.parse(gst.toStringAsFixed(2)));
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Login();
                    },
                  );
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => const Option()));
                },
                child: Text(
                  "Check out",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
