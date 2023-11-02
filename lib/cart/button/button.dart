// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../login/option.dart';

import '../../login_register/bottomSheet.dart';
import '../widget/charges.dart';

class Button extends StatelessWidget {
  final double subtotal;
  final tip;

  Button({super.key, required this.subtotal, required this.tip});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.only(
          left: 14.0,
          right: 14,
          bottom: 8.0,
          top: 4.0,
        ),
        child: Column(
          children: [
            Charges(
                name: "Subtotal",
                cost: double.parse(subtotal.toStringAsFixed(2))),
            Charges(name: "Shipping Cost", cost: 10),
            Charges(name: "GST", cost: 4),
            Charges(name: "Tip", cost: tip),
            SizedBox(
              height: 12,
            ),
            Charges(
                name: "Total",
                cost: tip + 14 + double.parse(subtotal.toStringAsFixed(2))),
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
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      side: BorderSide(
                        color: Colors.black38,
                      ),
                    ),
                  ),
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return GenieBottomSheet();
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
      ),
    );
  }
}
