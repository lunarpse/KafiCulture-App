// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:project_2/constants/payment_constants.dart';

class MyPopUp extends StatefulWidget {
  const MyPopUp({
    Key? key,
    required this.bgcolor,
    required this.textMsg,
    required this.logo,
    required this.bottomHeight,
  }) : super(key: key);

  final Color bgcolor;
  final String textMsg;
  final String logo;
  final double bottomHeight;

  @override
  State<MyPopUp> createState() => _MyPopUpState();
}

class _MyPopUpState extends State<MyPopUp> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    double mediaWidth = MediaQuery.of(context).size.width;
    return AlertDialog(
      actions: [
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  popupgradientcolor1,
                  popupgradientcolor2,
                ],
                begin: AlignmentDirectional.topStart,
                end: AlignmentDirectional.bottomEnd,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              border: Border.all(
                width: 1.5,
                color: borderallcolor,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    popupgradientcolor1,
                    popupgradientcolor2,
                  ],
                  begin: AlignmentDirectional.topStart,
                  end: AlignmentDirectional.bottomEnd,
                ),
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(
                  width: 1.5,
                  color:borderradiuscolor,
                ),
              ),
              child: Center(
                child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      //----------------------------------------------------------
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(17)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 200,
                              width: mediaWidth * 0.7,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(17),
                                    topRight: Radius.circular(17)),
                                color: widget.bgcolor,
                              ),
                              child: Image.asset(widget.logo),
                            ),
                            Container(
                              height: widget.bottomHeight,
                              width: mediaWidth * 0.7,
                              decoration: BoxDecoration(color: boxdeccolor),
                              child: Scaffold(
                                body: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Center(
                                        child: Text(widget.textMsg,
                                            style: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ]),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
