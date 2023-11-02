import 'package:flutter/material.dart';

// ignore: camel_case_types
class UpiList extends StatelessWidget {
  const UpiList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: 400,
      height: 180,
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
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Material(
                  child: InkWell(
                    splashColor: Colors.green,
                    onTap: () {},
                    child: Ink.image(
                      image: const AssetImage('assets/images/gpayyy.png'),
                      width: 65,
                      height: 60,
                      alignment: Alignment.center,
                    ),
                  ),
                ),
                Material(
                  child: InkWell(
                    splashColor: Colors.black,
                    onTap: () {},
                    child: Ink.image(
                      image: const AssetImage('assets/images/Amazonpay.png'),
                      width: 65,
                      height: 60,
                    ),
                  ),
                ),
                Material(
                  child: InkWell(
                    splashColor: Colors.blue,
                    onTap: () {},
                    child: Ink.image(
                      image: const AssetImage('assets/images/Paytm.png'),
                      width: 65,
                      height: 60,
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          TextButton(
            onPressed: () {},
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Other UPI Options ',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                  ),
                ),
                Icon(Icons.arrow_forward_outlined)
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
