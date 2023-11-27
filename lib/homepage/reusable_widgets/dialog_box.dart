// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../model/json_model.dart';

class DialogBox extends StatelessWidget {
  const DialogBox({
    super.key,
    required this.productName,
    required this.buttonName,
    required this.call,
    required this.addons,
    required this.finalPrice,
    required this.qty,
  });

  final productName, buttonName, finalPrice, qty;
  final Function call;
  final List<AddonModel> addons;

  @override
  Widget build(BuildContext context) {
    int? checkedIndex;
    double totalPrice = finalPrice;
    var singlePrice = finalPrice / qty;
    return AlertDialog(
        insetPadding: EdgeInsets.all(20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        content: StatefulBuilder(builder: (context, setState) {
          return Container(
            width: double.maxFinite,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Addons",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: addons.length,
                  itemBuilder: (context, index) {
                    var addon = addons[index];
                    var addonsName = addon.addonsName;
                    var price = addon.price;
                    return Padding(
                      padding: const EdgeInsets.all(3),
                      child: CheckboxListTile(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        tileColor: Colors.grey.withOpacity(0.4),
                        checkboxShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4)),
                        side: BorderSide(
                            color: Color.fromRGBO(168, 93, 38, 1), width: 2),
                        value: checkedIndex == index,
                        onChanged: (bool? newValue) {
                          setState(() {
                            if (newValue!) {
                              checkedIndex = index;
                              totalPrice = double.parse(
                                  (finalPrice + price).toStringAsFixed(2));
                            } else {
                              checkedIndex = null;
                              totalPrice = finalPrice;
                            }
                          });
                        },
                        title: Text(
                          addonsName,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(168, 93, 38, 1)),
                        ),
                        subtitle: Text(
                          "\$ $price",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                        activeColor: Color.fromRGBO(168, 93, 38, 1),
                        checkColor: Colors.white,
                      ),
                    );
                  },
                ),
                Divider(
                  color: Colors.black,
                  thickness: 3,
                ),
                Container(
                  // height: 82,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        Container(
                          width: 170,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "CURRENT ITEM",
                                style: TextStyle(
                                    fontSize: 11,
                                    color: Colors.white60,
                                    letterSpacing: 0.8),
                              ),
                              SizedBox(height: 5),
                              Text(
                                productName,
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                totalPrice.toString(),
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              )
                            ],
                          ),
                        ),
                        Container(
                            width: 129,
                            child: Center(
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                    fixedSize: MaterialStateProperty.all(
                                        Size(130, 50)),
                                    elevation: MaterialStatePropertyAll(6),
                                    backgroundColor: MaterialStateProperty.all(
                                        Color.fromRGBO(168, 93, 38, 1)),
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    )),
                                  ),
                                  onPressed: () {
                                    print("dialog $totalPrice");
                                    call(singlePrice);
                                  },
                                  child: Text(
                                    buttonName,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ))
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        }));
  }
}
