import 'package:flutter/material.dart';
import 'package:project_2/constants/color_constants.dart';

import 'package:project_2/constants/text_constants.dart';

class ThankYou extends StatelessWidget {
  const ThankYou({super.key});

  @override
  Widget build(BuildContext context) {
    bool feedbackGiven = true;
    return Container(
      height: 100,
      color: thankyoufeedbackcolor,
      child:  Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle_outlined,
              color: feedbacktextcolorr,
            ),
            Text(
              endrating,
              style: TextStyle(color:feedbacktextcolorr),
            ),
          ],
        ),
      ),
    );
  }
}
