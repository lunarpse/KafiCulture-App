// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_2/cart/riverpod/state_provider.dart';
import 'package:project_2/cart/riverpod/tipstate_provider.dart';
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
  int itcvalue = 0;
  int handm_value = 0;
  int airvalue = 0;
  @override
  Widget build(BuildContext context) {
    double mediaWidth = MediaQuery.of(context).size.width;

    final data = ref.watch(CartProvider);
    double gst = ref.watch(TipProvider)["gst"];

    final tc =
        data.isNotEmpty ? data.map((e) => e["price"] * e["quantity"]) : [];

    final double subt = tc.length != 0
        ? tc.reduce((value, element) => value + element) + gst
        : 0;

    final amount = double.parse(subt.toStringAsFixed(2));
    double final_price =
        amount - itcvalue * 0.01 - handm_value * 0.01 - airvalue * 0.01;
    String strPrice = final_price.toStringAsFixed(2);
    return Scaffold(
      appBar: AppbarWidget(),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //Order list need to be added
              Container(
                  color: const Color.fromARGB(255, 240, 232, 232),
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 8, bottom: 15),
                  child: Column(
                    children: data.map((data1) {
                      return CartItem(
                        data: data1,
                        atpayment: true,
                      );
                    }).toList(),
                  )),
              // for(dynamic dt in data) CartItem(data: dt,atpayment: true,),

              Container(
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
                  "\$ $strPrice ",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),

              Divider(
                height: 20,
                color: Colors.black,
              ),
              SizedBox(height: 8),
              Padding(
                padding: EdgeInsets.only(
                  left: 8,
                ),
                child: Text(
                  'Payment Methods ',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),

              SizedBox(
                height: 10,
              ),

              //-----------------------------------------------SWAP

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: Color.fromARGB(255, 111, 78, 55),
                  child: ExpansionTile(
                    title: Container(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "SWAP",
                          style: TextStyle(
                              fontSize: 33,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Text(
                          "Recommended",
                          style: TextStyle(
                            color: Color.fromARGB(255, 154, 143, 142),
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    )),
                    children: [
                      Row(
                        children: [
                          const SizedBox(
                            width: 15,
                          ),
                          SizedBox(
                            width: 43,
                            height: 43,
                            child: Image.asset("assets/images/itc.png"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              itcvalue.toString(),
                              style: const TextStyle(
                                fontSize: 22.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 250,
                            child: Slider(
                              value: itcvalue.toDouble(),
                              onChanged: (double newValue) {
                                setState(() {
                                  itcvalue = newValue.round();
                                });
                              },
                              min: 0,
                              max: 100,
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 15,
                          ),
                          SizedBox(
                            width: 43,
                            height: 43,
                            child: Image.asset("assets/images/h&m.png"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              handm_value.toString(),
                              style: const TextStyle(
                                fontSize: 22.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 250,
                            child: Slider(
                              value: handm_value.toDouble(),
                              onChanged: (double newValue) {
                                setState(() {
                                  handm_value = newValue.round();
                                });
                              },
                              min: 0,
                              max: 100,
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 15,
                          ),
                          Container(
                            width: 43,
                            height: 43,
                            child: Image.asset("assets/images/airline.webp"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              airvalue.toString(),
                              style: const TextStyle(
                                fontSize: 22.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Container(
                            width: 250,
                            child: Slider(
                              value: airvalue.toDouble(),
                              onChanged: (double newValue) {
                                setState(() {
                                  airvalue = newValue.round();
                                });
                              },
                              min: 0,
                              max: 100,
                            ),
                          )
                        ],
                      ),
                      OutlinedButton(
                          onPressed: () {
                            var snackbar = SnackBar(
                              content: Text(
                                "Thanks for choosing SWAP please pay rest \$$strPrice pay via UPI or card",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 15, 58, 23),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              duration: Duration(seconds: 2),
                              backgroundColor:
                                  Color.fromARGB(255, 243, 243, 242),
                              dismissDirection: DismissDirection.up,
                              margin: EdgeInsets.only(
                                  bottom:
                                      MediaQuery.of(context).size.height - 185,
                                  left: 40,
                                  right: 8),
                              padding: EdgeInsets.all(15),
                              behavior: SnackBarBehavior.floating,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  side: BorderSide(
                                      color: Color.fromARGB(255, 111, 78, 55),
                                      width: 1.5)),
                            );

                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackbar);
                          },
                          child: Text(
                            "Confirm",
                            style: TextStyle(fontSize: 23),
                          ))
                    ],
                  ),
                ),
              ),

              const Divider(
                height: 25,
                color: Colors.black,
              ),

              //---------------------------------------------UPI

              const SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: UPIPayment(),
              ),
              const SizedBox(height: 15),

              const SizedBox(height: 10),

              //------------------------------------------------CardPayment

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CardPayment(),
              ),
              const SizedBox(height: 15),

              //---------------------------------------------------wallets

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
