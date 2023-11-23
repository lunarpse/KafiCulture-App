import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:project_2/feedBack/FeedBack_page.dart';
import 'package:project_2/homepage/reusable_widgets/background_container_widget.dart';

class LoadingPayment extends StatefulWidget {
  const LoadingPayment({super.key});

  @override
  State<LoadingPayment> createState() => _LoadingPaymentState();
}

class _LoadingPaymentState extends State<LoadingPayment> {
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => FeedBackPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: BackgroundContainerWidget(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Processing",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 28,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 40),
              //it provide loading animation
              SpinKitFadingCircle(
                color: Colors.black,
                size: 50.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
