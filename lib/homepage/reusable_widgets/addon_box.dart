// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import '../model/json_model.dart';

class AddonBox extends StatefulWidget {
  const AddonBox(
      {super.key, required this.addons, required this.onAddonSelectionChanged});

  final List<AddonModel> addons;

  final Function onAddonSelectionChanged;

  @override
  State<AddonBox> createState() => _AddonBoxState();
}

class _AddonBoxState extends State<AddonBox> {
  int addonSelectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: widget.addons.length,
          itemBuilder: (context, index) {
            var addon = widget.addons[index];
            var addonsName = addon.addonsName;
            var price = addon.price;
            return Padding(
              padding: const EdgeInsets.only(bottom: 11, left: 8, right: 8),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    if (addonSelectedIndex == index) {
                      addonSelectedIndex = -1;
                      widget.onAddonSelectionChanged(0.0);
                    } else {
                      addonSelectedIndex = index;
                      widget.onAddonSelectionChanged(price);
                    }
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 13, horizontal: 18),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: index == addonSelectedIndex
                          ? LinearGradient(
                              colors: [
                                  Color.fromARGB(255, 17, 17, 19),
                                  Color.fromARGB(255, 17, 17, 19),
                                  Color.fromARGB(255, 61, 62, 65),
                                ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight)
                          : LinearGradient(
                              colors: [
                                  Colors.grey.shade500,
                                  Colors.grey.shade700,
                                  Colors.grey.shade900,
                                ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight),
                      border: index == addonSelectedIndex
                          ? Border.all(
                              color: Color.fromARGB(255, 17, 17, 19), width: 2)
                          : Border.all(color: Colors.grey.shade800, width: 1)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        addonsName,
                        style: TextStyle(
                          fontSize: 18,
                          color: index == addonSelectedIndex
                              ? Colors.white
                              : Colors.black,
                          fontWeight: index == addonSelectedIndex
                              ? FontWeight.w500
                              : FontWeight.w800,
                        ),
                      ),
                      Text(
                        "\$ $price",
                        style: TextStyle(
                          fontSize: 17,
                          color: index == addonSelectedIndex
                              ? Colors.white
                              : Colors.black,
                          fontWeight: index == addonSelectedIndex
                              ? FontWeight.w500
                              : FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        )
      ],
    );
  }
}
