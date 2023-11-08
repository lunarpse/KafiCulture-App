import 'package:flutter/material.dart';

class Charges extends StatelessWidget {
  final String name;
  final  cost;
  const Charges({super.key, required this.name, required this.cost});

  @override
  Widget build(BuildContext context) {
    final n=cost;
    return Container(
      margin: EdgeInsets.only(top: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            name,
            style: TextStyle(
              fontWeight: (name == "Subtotal" || name == "Total")
                  ? FontWeight.bold
                  : FontWeight.w500,
              fontSize: (name == "Subtotal" || name == "Total")?22:17
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "\$ ${cost}",
                style: TextStyle(
                  fontWeight: 
                       FontWeight.bold,
                      
                  fontSize: (name == "Subtotal" || name == "Total")?22:17
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
