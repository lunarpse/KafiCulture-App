import 'package:flutter/material.dart';
import 'package:project_2/constants/detailspage_constants.dart';
import 'package:project_2/constants/feedback_constants.dart';

class RatingStar extends StatefulWidget {
  RatingStar({super.key});

  @override
  State<RatingStar> createState() => _RatingStarState();
}

class _RatingStarState extends State<RatingStar> {
  @override
  List<bool> starRatings = [false, false, false, false, false];
  void updateStarRating(int index) {
    setState(() {
      for (int i = 0; i < starRatings.length; i++) {
        starRatings[i] = i <= index;
      }
    });
  }

  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(5, (index) {
          return GestureDetector(
            onTap: () => updateStarRating(index),
            child: Icon(
              starRatings[index] ? Icons.star : Icons.star_border,
              size: 40,
              color:colorrating,
            ),
          );
        }));
  }
}
