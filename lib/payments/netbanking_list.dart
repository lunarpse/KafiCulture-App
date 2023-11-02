import 'package:flutter/material.dart';

// ignore: camel_case_types
class NetbankingList extends StatelessWidget {
  const NetbankingList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: 400,
      height: 150,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 244, 242, 242),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.4),
              spreadRadius: 0,
              blurRadius: 4),
        ],
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Material(
                      child: InkWell(
                          splashColor: Colors.red,
                          onTap: () {},
                          child: Ink.image(
                              image: const AssetImage(
                                  "assets/images/Bank/Axisbank.png"),
                              width: 50,
                              height: 50,
                              alignment: Alignment.center))),
                  const SizedBox(height: 15),
                  Material(
                      child: InkWell(
                          splashColor: Colors.blue,
                          onTap: () {},
                          child: Ink.image(
                              image: const AssetImage(
                                  "assets/images/Bank/SBIbank.png"),
                              width: 50,
                              height: 50,
                              alignment: Alignment.center))),
                  const SizedBox(height: 15),
                  Material(
                      child: InkWell(
                          splashColor: Colors.orange,
                          onTap: () {},
                          child: Ink.image(
                              image: const AssetImage(
                                  "assets/images/Bank/Icicibank.png"),
                              width: 50,
                              height: 50,
                              alignment: Alignment.center))),
                  const SizedBox(height: 15),
                  Material(
                      child: InkWell(
                          splashColor: Colors.yellow,
                          onTap: () {},
                          child: Ink.image(
                              image: const AssetImage(
                                  "assets/images/Bank/Canarabank.png"),
                              width: 50,
                              height: 50,
                              alignment: Alignment.center))),
                ],
              ),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {},
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Other Banks',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                  ),
                  Icon(Icons.arrow_forward_outlined),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
