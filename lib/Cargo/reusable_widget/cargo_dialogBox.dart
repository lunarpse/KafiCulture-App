// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../../constants/color_constants.dart';

class CargoDialogBox extends StatelessWidget {
  const CargoDialogBox({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.all(20),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: Color.fromRGBO(143, 93, 58, 1), width: 2)),
      content: StatefulBuilder(
        builder: (context, setState) {
          return Container(
            width: double.maxFinite,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Do you want the product now or want to be delivered?",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(Size(130, 50)),
                        elevation: MaterialStatePropertyAll(6),
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromRGBO(143, 93, 58, 1)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        "Now",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    ElevatedButton.icon(
                      style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(Size(130, 50)),
                        elevation: MaterialStatePropertyAll(6),
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromRGBO(143, 93, 58, 1)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      label: Text(
                        "Deliver",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      icon: Icon(
                        Icons.local_shipping_outlined,
                        color: detailsshoppingbagcolor,
                        size: 21,
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
