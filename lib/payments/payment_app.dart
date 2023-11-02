import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_2/cart/riverpod/state_provider.dart';
import 'package:project_2/custom_appbar/genie_appbar.dart';
import 'package:project_2/login_register/bottomSheet.dart';
import 'package:project_2/remove/done.dart';
import 'package:project_2/remove/payments_back.dart';
import 'card_list.dart';
import 'netbanking_list.dart';
import 'upi_list.dart';
import 'wallet_list.dart';

// ignore: constant_identifier_names
enum SingingCharacter { Paytm, Amazonpay }

// ignore: camel_case_types
class PaymentApp extends ConsumerStatefulWidget {
  const PaymentApp({super.key});

  @override
  ConsumerState createState() => _PaymentAppState();
}

// ignore: camel_case_types
class _PaymentAppState extends ConsumerState {
  // ignore: unused_field, prefer_final_fields
  SingingCharacter? _character = SingingCharacter.Paytm;

  @override
  Widget build(BuildContext context) {
    double mediaWidth = MediaQuery.of(context).size.width;

    final data = ref.watch(CartProvider);

    final tc =
        data.isNotEmpty ? data.map((e) => e["cost"] * e["quantity"]) : [];

    final double subt = tc.length != 0
        ? tc.reduce((value, element) => value + element) + 14
        : 0;
    final amount = double.parse(subt.toStringAsFixed(2));
    return Scaffold(
      body: CustomAppBar(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Amount:',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: Colors.black,
                    fontStyle: FontStyle.normal),
              ),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "\$ $amount ",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
            const Divider(
              height: 20,
              color: Colors.black,
            ),
            const SizedBox(height: 8),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Payment Methods',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Done(),
                        ));
                  },
                  child: Container(
                    height: 45,
                    width: mediaWidth * 0.7,
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(colors: [
                          Color.fromARGB(255, 179, 88, 48),
                          Color.fromARGB(255, 183, 98, 70),
                          Color.fromARGB(255, 185, 132, 88)
                        ]),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text(
                        "via SWAP",
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: ElevatedButton.icon(
            //     onPressed: () {
            //       Navigator.push(
            //           context,
            //           MaterialPageRoute(
            //             builder: (context) => Done(),
            //           ));
            //     },
            //     label: const Text(
            //       "SWAP",
            //       style: TextStyle(fontSize: 15),
            //     ),
            //     icon: const Icon(Icons.swap_horiz_rounded),
            //     style: const ButtonStyle(alignment: Alignment.centerLeft),
            //   ),
            // ),
            const Divider(
              height: 25,
              color: Colors.black,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'UPI',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(height: 10),
            const UpiList(),
            const SizedBox(height: 15),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Cards',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(height: 10),
            const CardList(),
            const SizedBox(height: 15),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Wallets',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(height: 10),
            const WalletList(),
            const SizedBox(height: 15),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Net Banking',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(height: 10),
            const NetbankingList(),
            const SizedBox(height: 10)
          ],
        ),
      )),
    );
  }
}
