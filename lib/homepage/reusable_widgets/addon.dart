// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project_2/constants/color_constants.dart';
import '../../constants/text_constants.dart';
import '../model/json_model.dart';

class AddOnBox extends StatelessWidget {
  const AddOnBox({
    super.key,
    required this.call,
    required this.addons,
    required this.finalPrice,
    required this.selectedindex,
  });

  final finalPrice;
  final Function call;
  final List<AddonModel> addons;
  final int selectedindex;

  @override
  Widget build(BuildContext context) {
    int? checkedIndex;
    double totalPrice = finalPrice;
    final sizeindex = selectedindex == 0
        ? addonSizeTall
        : selectedindex == 1
            ? addonSizeGrande
            : addonSizeVenti;

    return StatefulBuilder(builder: (context, setState) {
      return Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: addonBoxcontainerBordercolor, width: 3)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: addons.length,
              itemBuilder: (context, index) {
                var addon = addons[index];
                var addonsName = addon.addonsName;
                var price = addon.price;
                return Padding(
                  padding: const EdgeInsets.all(3),
                  child: CheckboxListTile(
                    dense: true,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    tileColor: addonBoxcheckboxtilecolor,
                    checkboxShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                    side: BorderSide(color: addonBoxbordersidecolor, width: 2),
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
                        call(totalPrice);
                      });
                    },
                    title: Text(
                      addonsName,
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: addonBoxaddonnamecolor),
                    ),
                    subtitle: Text(
                      "\$ $price",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    activeColor: addonBoxactivecolor,
                    checkColor: addonBoxcheckcolor,
                  ),
                );
              },
            ),
            Divider(
              color: addonBoxdivcolor,
              thickness: 3,
            ),
            Container(
              width: double.maxFinite,
              decoration: BoxDecoration(
                  color: addonBoxboxdecorationcolor,
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            addonSizeText,
                            style: TextStyle(
                              fontSize: 16,
                              color: addonBoxproductnamecolor,
                              letterSpacing: 0.8,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            sizeindex,
                            style: TextStyle(
                                letterSpacing: 0.9,
                                fontSize: 18,
                                color: addonBoxpricetextcolor),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 3),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            addonFinalpriceText,
                            style: TextStyle(
                              fontSize: 16,
                              color: addonBoxproductnamecolor,
                              letterSpacing: 0.8,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "\$ $totalPrice",
                            style: TextStyle(
                                fontSize: 18, color: addonBoxpricetextcolor),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
