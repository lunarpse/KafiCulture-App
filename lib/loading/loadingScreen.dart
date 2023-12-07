import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:project_2/constants/loadingscreen_constants.dart';
import 'package:project_2/constants/text_constants.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4), () {
      Navigator.pushReplacementNamed(context, "/feedback");
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actions: [
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  loadinggradientcolor1,
                  loadinggradientcolor2,
                ],
                begin: AlignmentDirectional.topStart,
                end: AlignmentDirectional.bottomEnd,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              border: Border.all(
                width: 1.5,
                color: bordercolor,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                   lineargracolor1,
                    lineargracolor2,
                  ],
                  begin: AlignmentDirectional.topStart,
                  end: AlignmentDirectional.bottomEnd,
                ),
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(
                  width: 1.5,
                  color:bordercolor2,
                ),
              ),
              child:  Center(
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      processing,
                      style: TextStyle(
                          color: textcolor,
                          fontSize: 28,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(height: 40),
                    //it provide loading animation
                    SpinKitFadingCircle(
                      color: textcolor,
                      size: 50.0,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
