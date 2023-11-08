import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LoginBtn extends StatelessWidget {
  LoginBtn(
      {super.key,
      required this.borderRadius,
      required this.btnHeight,
      required this.btnWidth,
      required this.color,
      required this.fontSize,
      required this.text,
      required this.textColor,
      required this.onTab,
      this.boxdecoration,
      required this.gradientColor1,
      required this.gradientColor2,
      required this.gradientColor3,
      required this.boxShadow1,
      required this.boxShadow2,
      required this.boxShadow3});

  final double btnHeight;
  final double btnWidth;
  final Color color;
  final Color gradientColor1;
  final Color gradientColor2;
  final Color gradientColor3;

  final String text;
  final Color textColor;
  final double fontSize;
  final double borderRadius;
  final Function() onTab;
  BoxDecoration? boxdecoration;
  final BoxShadow boxShadow1;
  final BoxShadow boxShadow2;
  final BoxShadow boxShadow3;

  @override
  Widget build(context) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
        height: btnHeight,
        width: btnWidth,
        decoration: BoxDecoration(
            boxShadow: [
              boxShadow1,
              boxShadow2,
              boxShadow3,
            ],
            borderRadius: BorderRadius.circular(borderRadius),
            gradient: LinearGradient(
                colors: [gradientColor1, gradientColor2, gradientColor3])),
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: textColor, fontSize: fontSize),
          ),
        ),
      ),
    );
  }
}

class LoginTextButton extends StatelessWidget {
  const LoginTextButton(
      {super.key,
      required this.text,
      required this.size,
      required this.color,
      required this.onTab});

  final String text;
  final double size;
  final Color color;
  final Function() onTab;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Text(
        text,
        style: TextStyle(
          fontSize: size,
          color: color,
        ),
      ),
    );
  }
}
