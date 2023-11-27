import 'package:flutter/material.dart';

class CompanyName extends StatelessWidget {
  const CompanyName(
      {super.key,
      required this.companyName,
      required this.companyLogo,
      required this.value,
      required this.child,
      required this.points,
      required this.factor});

  final String companyName;
  final String companyLogo;
  final int value;
  final int points;
  final double factor;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(top: 8.0, bottom: 8, right: 16, left: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage(companyLogo))),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      companyName,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Container(
                width: 70,
                height: 30,
                decoration: BoxDecoration(
                  gradient:
                      LinearGradient(colors: [Colors.white, Colors.white70]),
                  border: Border.all(),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 3.0, // soften the shadow
                      spreadRadius: 2.0, //extend the shadow
                    ),
                  ],
                ),
                // color: Colors.white,
                child: Center(
                  child: Text(
                    "\$ ${(value * factor).toStringAsFixed(2)}",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.brown),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          child: child,
          // width: 250,
          // child: Slider(
          //   divisions: 100,
          //   label: " ${widget.value.toString()}/100",
          //   activeColor: Colors.white,
          //   value: widget.value.toDouble(),
          //   onChanged: (double newValue) {
          //     setState(() {
          //       value = newValue.round();
          //     });
          //   },
          //   min: 0,
          //   max: 100,
          // ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.white,
                      Color.fromARGB(255, 229, 193, 159),
                    ],
                  ),
                ),
                child: Text(
                  "1USD=$points $companyName Points",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
