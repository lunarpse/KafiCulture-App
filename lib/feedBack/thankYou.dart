import 'package:flutter/material.dart';

class ThankYou extends StatelessWidget {
  const ThankYou({super.key});

  @override
  Widget build(BuildContext context) {
    bool feedbackGiven = true;
    return Container(
      height: 100,
      color: Colors.green,
      child: const Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle_outlined,
              color: Colors.white,
            ),
            Text(
              'Thank you for your feedback',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
