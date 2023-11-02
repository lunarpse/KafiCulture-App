import 'package:flutter/material.dart';
import 'package:project_2/login_register/demoLogin.dart';

import '../payments/payment_app.dart';
import 'loginscreen.dart';
// import 'package:genie_merger/login/loginscreen.dart';
// import 'package:genie_merger/payments/payment_app.dart';

class Option extends StatelessWidget {
  const Option({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PaymentApp()));
                },
                child: const Text("Guest")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Demo()));
                },
                child: const Text("Login"))
          ],
        ),
      ),
    );
  }
}
