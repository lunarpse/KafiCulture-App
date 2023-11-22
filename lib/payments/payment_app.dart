// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_2/cart/riverpod/state_provider.dart';
import 'package:project_2/cart/riverpod/tipstate_provider.dart';
import 'package:project_2/cart/widget/cart_item.dart';
import 'package:project_2/customdrawer/drawerScreen.dart';

import 'package:project_2/appbar/appbar_widget.dart';
import 'package:project_2/homepage/reusable_widgets/background_container_widget.dart';

import 'package:project_2/newfeature/card_payment.dart';
import 'package:project_2/newfeature/upi_payment.dart';

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
      drawer: DrawerScreen(),
      body: BackgroundContainerWidget(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //Order list need to be added
              Container(
                  height: 150,
                  color: const Color.fromARGB(255, 240, 232, 232),
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 8, bottom: 15),
                  child: SingleChildScrollView(
                    child: Column(
                      children: data.map((data1) {
                        return CartItem(
                          data: data1,
                          atpayment: true,
                        );
                      }).toList(),
                    ),
                  )),

              SizedBox(height: 8),
              Padding(
                padding: EdgeInsets.only(left: 8, right: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Select Payment Method ',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      '\$ $amount',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 25,
                          color: Colors.black,
                          fontStyle: FontStyle.normal),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 10,
              ),
              //-------------------------------------------------newSwap
              Container(
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                    color: Colors.amber,
                    gradient: LinearGradient(colors: [
                      Color.fromRGBO(255, 136, 102, 0.67),
                      Color.fromRGBO(255, 221, 136, 0.28),
                    ])),
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          "assets/images/swap.png",
                          height: 40,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Recommended",
                            style: TextStyle(
                                fontSize: 17,
                                color: Colors.black54,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ]),
                ),
              ),

              Column(
                children: [
                  //                                                        ITC International
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "ITC International",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Container(
                              width: 70,
                              height: 30,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [Colors.white, Colors.white70]),
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
                                  "\$ ${(itcvalue * 0.01).toStringAsFixed(2)}",
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
                        // width: 250,
                        child: Slider(
                          divisions: 100,
                          label: " ${itcvalue.toString()}/100",
                          activeColor: Colors.white,
                          value: itcvalue.toDouble(),
                          onChanged: (double newValue) {
                            setState(() {
                              itcvalue = newValue.round();
                            });
                          },
                          min: 0,
                          max: 100,
                        ),
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
                              child: Text("1USD=100 ITC Points"),
                            )
                          ],
                        ),
                      )
                    ],
                  ),

                  //                                                        H&M
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "H&M",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Container(
                              width: 70,
                              height: 30,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [Colors.white, Colors.white70]),
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
                                  "\$ ${(handm_value * 0.01).toStringAsFixed(2)}",
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
                        // width: 250,
                        child: Slider(
                          divisions: 100,
                          label: " ${handm_value.toString()}/100",
                          activeColor: Colors.white,
                          value: handm_value.toDouble(),
                          onChanged: (double newValue) {
                            setState(() {
                              handm_value = newValue.round();
                            });
                          },
                          min: 0,
                          max: 100,
                        ),
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
                              child: Text("1USD=100 ITC Points"),
                            )
                          ],
                        ),
                      )
                    ],
                  ),

                  //                                                         Emirates
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Emirates",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Container(
                              width: 70,
                              height: 30,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [Colors.white, Colors.white70]),
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
                                  "\$ ${(airvalue * 0.01).toStringAsFixed(2)}",
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
                        // width: 250,
                        child: Slider(
                          divisions: 100,
                          label: " ${airvalue.toString()}/100",
                          activeColor: Colors.white,
                          value: airvalue.toDouble(),
                          onChanged: (double newValue) {
                            setState(() {
                              airvalue = newValue.round();
                            });
                          },
                          min: 0,
                          max: 100,
                        ),
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
                              child: Text("1USD=100 Emirates Points"),
                            )
                          ],
                        ),
                      )
                    ],
                  ),

                  //                                                    Confirmation button

                  Padding(
                    padding: const EdgeInsets.only(
                      top: 25,
                      bottom: 10,
                    ),
                    child: InkWell(
                      onTap: () {
                        if (final_price < 0) {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(17)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 200,
                                      width: mediaWidth * 0.7,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(17),
                                            topRight: Radius.circular(17)),
                                        color: Color.fromARGB(255, 130, 5, 5),
                                      ),
                                      child: Image.asset(
                                          "assets/images/mistake.png"),
                                    ),
                                    Container(
                                      height: 100,
                                      width: mediaWidth * 0.7,
                                      decoration:
                                          BoxDecoration(color: Colors.white),
                                      child: Scaffold(
                                        body: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(17),
                                                bottomRight:
                                                    Radius.circular(17)),
                                            // boxShadow: List.filled(
                                            //     6,
                                            //     BoxShadow(
                                            //         color: Colors.black12)),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Center(
                                                  child: Text(
                                                      "Warning : You used access Loyalty points then required",
                                                      style: TextStyle(
                                                          fontSize: 22,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                ),
                                              ),
                                              ElevatedButton(
                                                  onPressed: () =>
                                                      Navigator.pushNamed(
                                                          context, "/payment"),
                                                  child: Text("Go Back"))
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                          );
                        } else if (final_price == 0) {
                        } else {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(17)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 200,
                                      width: mediaWidth * 0.7,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(17),
                                            topRight: Radius.circular(17)),
                                        color: Colors.green,
                                      ),
                                      child: Image.asset(
                                          "assets/images/smile.png"),
                                    ),
                                    Container(
                                      height: 100,
                                      width: mediaWidth * 0.7,
                                      decoration:
                                          BoxDecoration(color: Colors.white),
                                      child: Scaffold(
                                        body: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Center(
                                                child: Text(
                                                    "Thanks for Using SWAP",
                                                    style: TextStyle(
                                                        fontSize: 22,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ),
                                            ),
                                            ElevatedButton(
                                                onPressed: () =>
                                                    Navigator.pushNamed(
                                                        context, "/payment"),
                                                child: Text(
                                                    "Continue with UPI/Card"))
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                          );

                          //Navigator.pushNamed(context, "/feedback");
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromARGB(255, 98, 2, 2)),
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                            colors: [
                              Color.fromRGBO(226, 215, 212, 0.467),
                              Color.fromRGBO(240, 214, 191, 1),
                            ],
                          ),
                        ),
                        width: mediaWidth * 0.9,
                        height: 55,
                        child: Center(
                          child: Text(
                            "Confirm",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: const Color.fromARGB(255, 255, 106, 7)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              //--------------------------------------------------newSwap

              //-----------------------------------------------SWAP

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

              // const Padding(
              //   padding: EdgeInsets.all(8.0),
              //   child: Text(
              //     'Wallets',
              //     style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              //   ),
              // ),
              // const SizedBox(height: 10),
              // const WalletList(),
              // const SizedBox(height: 15),
              // const Padding(
              //   padding: EdgeInsets.all(8.0),
              //   child: Text(
              //     'Net Banking',
              //     style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              //   ),
              // ),
              // const SizedBox(height: 10),
              // const NetbankingList(),
              // const SizedBox(height: 10)
            ],
          ),
        ),
      ),
    );
  }
}
