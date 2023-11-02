import 'package:flutter/material.dart';

class Charges extends StatelessWidget {
  final String name;
  final double cost;
  const Charges({super.key, required this.name, required this.cost});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          name,
          style: TextStyle(
            fontWeight: (name == "Subtotal" || name == "Total")
                ? FontWeight.bold
                : FontWeight.w400,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "\$ ${cost}",
              style: TextStyle(
                fontWeight: (name == "Subtotal" || name == "Total")
                    ? FontWeight.bold
                    : FontWeight.w400,
                fontSize: 18.0,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
