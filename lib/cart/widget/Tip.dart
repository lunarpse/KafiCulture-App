// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Tip extends StatelessWidget {
  const Tip({super.key, required this.addtip});

  final Function addtip;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 238, 225, 224),
        borderRadius: BorderRadius.circular(29),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.9),
            offset: Offset(0, 2),
            blurRadius: 2,
            spreadRadius: 3,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(left: 15),
            child: Text(
              "Tip :",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
          ),
          TextButton(
              style: ButtonStyle(),
              onPressed: () {
                addtip(0.00);
              },
              child: Text(
                "0",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              )),
          TextButton(
              style: ButtonStyle(),
              onPressed: () {
                addtip(5.toDouble());
              },
              child: Text(
                "5",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              )),
          TextButton(
              onPressed: () {
                addtip(10.toDouble());
              },
              child: Text(
                "10",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              )),
          TextButton(
              onPressed: () {
                addtip(15.toDouble());
              },
              child: Text(
                "15",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              )),
          TextButton(
              onPressed: () {
                addtip(20.toDouble());
              },
              child: Text(
                "20",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ))
        ],
      ),
    );
  }
}
