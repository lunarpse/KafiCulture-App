// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../model/json_model.dart';

class DialogBox extends StatefulWidget {
  final initialname;

  const DialogBox(
      {super.key,
      required this.productName,
      required this.buttonName,
      required this.call,
      required this.addons,
      required this.finalPrice,
      required this.initialname,
      required this.setname});
  final Function setname;
  final productName, buttonName, finalPrice;
  final Function call;
  final List<AddonModel> addons;

  @override
  State<DialogBox> createState() => _DialogBoxState();
}

class _DialogBoxState extends State<DialogBox> {
  // var name;
  // var newprice;
  // @override
  // void initState() {
  //   name = widget.initialname;
  //   newprice = widget.addons[0].price;
  // }

  @override
  Widget build(BuildContext context) {
    var name = widget.initialname;

    var newprice = double.parse(widget.addons[0].price);
    // double finalprice1 = widget.finalPrice + double.parse(newprice);
    // final finalprice = finalprice1.toStringAsFixed(2);
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
                  itemCount: widget.addons.length,
                  itemBuilder: (context, index) {
                    var addon = widget.addons[index];
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
                        value: name == addonsName ? true : false,
                        onChanged: (bool? newValue) {
                          widget.setname(addonsName);
                          setState(() {
                            name = addonsName;

                            newprice = double.parse(price);
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
                                widget.productName,
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "${double.parse((widget.finalPrice + newprice).toString()).toStringAsFixed(2)}",
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
                                    widget.call(widget.finalPrice + newprice);
                                  },
                                  child: Text(
                                    widget.buttonName,
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
