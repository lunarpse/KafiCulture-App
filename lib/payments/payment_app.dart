import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_2/cart/riverpod/state_provider.dart';
import 'package:project_2/cart/widget/cart_item.dart';
import 'package:project_2/login_register/loginBtns.dart';
import 'package:project_2/login_register/loginText.dart';
// import 'package:project_2/cart/cart_riverpod/state_provider.dart';
// import 'package:project_2/hjc/cart_riverpod/state_provider.dart';

import 'package:project_2/myhomepage/pages/home_page/home_page.dart';
import 'package:project_2/appbar/appbar_widget.dart';
import 'package:project_2/newfeature/card_payment.dart';
import 'package:project_2/newfeature/upi_payment.dart';

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
      appBar: AppbarWidget(),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Order list need to be added

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
                padding: EdgeInsets.only(
                  left: 8,
                ),
                child: Text(
                  'Payment Methods ',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(
                  left: 8,
                ),
                child: Text(
                  '(Recommended)',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.red),
                ),
              ),

              const SizedBox(
                height: 10,
              ),
              Center(
                child: LoginBtn(
                  borderRadius: 33,
                  btnHeight: 55,
                  btnWidth: 300,
                  color: Colors.black,
                  fontSize: 20,
                  text: "SWAP",
                  textColor: Colors.white,
                  onTab: () {
                    Navigator.pushNamed(context, '/swap');
                  },
                  gradientColor1: Color.fromARGB(255, 111, 78, 55),
                  gradientColor2: Color.fromARGB(255, 111, 78, 55),
                  gradientColor3: Color.fromARGB(255, 111, 78, 55),
                  boxShadow1: const BoxShadow(
                      color: Color.fromARGB(255, 0, 0, 0),
                      offset: Offset(4.0, 4.0),
                      blurRadius: 15,
                      spreadRadius: 1.0),
                  boxShadow2: const BoxShadow(
                      color: Colors.black,
                      offset: Offset(4.0, 4.0),
                      blurRadius: 15,
                      spreadRadius: 1.0),
                  boxShadow3: const BoxShadow(
                      color: Colors.black,
                      offset: Offset(4.0, 4.0),
                      blurRadius: 15,
                      spreadRadius: 1.0),
                ),
              ),

              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Center(
              //     child: GestureDetector(
              //       onTap: () {
              //         Navigator.push(
              //             context,
              //             MaterialPageRoute(
              //               builder: (context) => HomePage(),
              //             ));
              //       },
              //       child: Container(
              //         height: 45,
              //         width: mediaWidth * 0.7,
              //         decoration: BoxDecoration(
              //             gradient: const LinearGradient(colors: [
              //               Color.fromARGB(255, 179, 88, 48),
              //               Color.fromARGB(255, 183, 98, 70),
              //               Color.fromARGB(255, 185, 132, 88)
              //             ]),
              //             borderRadius: BorderRadius.circular(10)),
              //         child: Center(
              //           child: Text(
              //             "SWAP",
              //             style: TextStyle(color: Colors.white, fontSize: 25),
              //           ),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),

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
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: UPIPayment(),
              ),
              const SizedBox(height: 15),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Cards',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CardPayment(),
              ),
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
        ),
      ),
    );
  }
}
