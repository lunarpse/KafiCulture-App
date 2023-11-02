import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  LoginTextField(
      {super.key,
      required this.size,
      required this.borderRadius,
      required this.borderColor,
      required this.fillColor,
      required this.padding,
      required this.labelText,
      required this.controller,
      required this.hideText,
      required this.validator,
      required this.onSaved});

  final double size;
  final Color borderColor;
  final double borderRadius;
  final Color fillColor;
  final double padding;
  final String labelText;
  final TextEditingController controller;
  final bool hideText;
  final String? Function(String?) validator;
  final void Function(String?) onSaved;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: TextFormField(
        controller: controller,
        obscureText: hideText,
        onSaved: onSaved,
        validator: validator,
        style: TextStyle(fontSize: size),
        decoration: InputDecoration(
          labelText: labelText,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          fillColor: fillColor,
          filled: true,
        ),
      ),
    );
  }
}
