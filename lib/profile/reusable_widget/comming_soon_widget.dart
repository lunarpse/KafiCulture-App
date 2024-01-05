// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project_2/constants/color_constants.dart';

class CommingSoonWidget extends StatelessWidget {
  const CommingSoonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/bg4.jpg'),
          fit: BoxFit.fill,
          colorFilter: ColorFilter.mode(
            bgcontainercolor.withOpacity(0.2),
            BlendMode.dstATop,
          ),
        ),
      ),
      child: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Feature Coming Soon..",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(107, 49, 20, 1),
            ),
          ),
          SizedBox(width: 5),
          Icon(
            FontAwesomeIcons.faceSmile,
            size: 32,
            color: Color.fromRGBO(107, 49, 20, 1),
          )
        ],
      )),
    );
  }
}
