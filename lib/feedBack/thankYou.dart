import 'package:flutter/material.dart';
import 'package:project_2/constants/feedback_constants.dart';
import 'package:project_2/constants/text_constants.dart';

class ThankYou extends StatelessWidget {
  const ThankYou({super.key});

  @override
  Widget build(BuildContext context) {
    bool feedbackGiven = true;
    return Container(
      height: 100,
      color: feedbackcolor,
      child:  Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle_outlined,
              color: textcolorr,
            ),
            Text(
              endrating,
              style: TextStyle(color:textcolorr),
            ),
          ],
        ),
      ),
    );
  }
}
