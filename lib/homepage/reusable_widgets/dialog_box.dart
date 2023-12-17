// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project_2/constants/color_constants.dart';
// import '../../constants/dialogbox_constants.dart';
import '../../constants/text_constants.dart';
import '../model/json_model.dart';

class DialogBox extends StatelessWidget {
  const DialogBox({
    super.key,
    required this.productName,
    required this.buttonName,
    required this.call,
    required this.addons,
    required this.finalPrice,
  });

  final productName, buttonName, finalPrice;
  final Function call;
  final List<AddonModel> addons;

  @override
  Widget build(BuildContext context) {
    int? checkedIndex;
    double totalPrice = finalPrice;
    return AlertDialog(
      insetPadding: EdgeInsets.all(20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      content: StatefulBuilder(
        builder: (context, setState) {
          return Container(
            width: double.maxFinite,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  addon,
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
                        tileColor: dialogboxcheckboxtilecolor,
                        checkboxShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4)),
                        side: BorderSide(
                            color: dialogboxbordersidecolor, width: 2),
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
                              color: dialogboxaddonnamecolor),
                        ),
                        subtitle: Text(
                          "\$ $price",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                        activeColor: dialogboxactivecolor,
                        checkColor: dialogboxcheckcolor,
                      ),
                    );
                  },
                ),
                Divider(
                  color: dialogboxdivcolor,
                  thickness: 3,
                ),
                Container(
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      color: dialogboxboxdecorationcolor,
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
                                currentitem,
                                style: TextStyle(
                                    fontSize: 11,
                                    color: dialogboxcurrentitemcolor,
                                    letterSpacing: 0.8),
                              ),
                              SizedBox(height: 5),
                              Text(
                                productName,
                                style: TextStyle(
                                    fontSize: 18,
                                    color: dialogboxproductnamecolor,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                totalPrice.toString(),
                                style: TextStyle(
                                    fontSize: 16,
                                    color: dialogboxpricetextcolor),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: 129,
                          child: Center(
                            child: ElevatedButton(
                              style: ButtonStyle(
                                fixedSize:
                                    MaterialStateProperty.all(Size(130, 50)),
                                elevation: MaterialStatePropertyAll(6),
                                backgroundColor: MaterialStateProperty.all(
                                    dialogboxelevatebuttonbgcolor),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                              ),
                              onPressed: () {
                                print("dialog $totalPrice");
                                call(totalPrice);
                              },
                              child: Text(
                                buttonName,
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
