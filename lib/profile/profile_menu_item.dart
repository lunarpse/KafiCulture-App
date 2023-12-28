// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ProfileMenuItem extends StatelessWidget {
  const ProfileMenuItem(
      {super.key,
      required this.title,
      required this.iconName,
      required this.pressed});

  final String title;
  final IconData iconName;
  final VoidCallback pressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: pressed,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: ListTile(
            leading: Icon(
              iconName,
              size: 26,
              color: Color.fromRGBO(107, 49, 20, 1),
            ),
            title: Text(
              title,
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w600,
                color: Color.fromRGBO(107, 49, 20, 1),
              ),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              size: 18,
              color: Color.fromRGBO(107, 49, 20, 1),
            )),
      ),
    );
  }
}
