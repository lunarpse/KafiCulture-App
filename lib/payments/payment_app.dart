// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_2/cart/riverpod/state_provider.dart';
import 'package:project_2/cart/riverpod/tipstate_provider.dart';

import 'package:project_2/customdrawer/drawerScreen.dart';

import 'package:project_2/appbar/appbar_widget.dart';
import 'package:project_2/homepage/reusable_widgets/background_container_widget.dart';

import 'package:project_2/newfeature/card_payment.dart';
import 'package:project_2/newfeature/company_name.dart';
import 'package:project_2/newfeature/mypopUp.dart';
import 'package:project_2/newfeature/payment_cart.dart';
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

  final ExpansionTileController controller = ExpansionTileController();

  int itcvalue = 0;
  int handm_value = 0;
  int airvalue = 0;
  bool initiallyExpanded = true;
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
        amount - itcvalue * 0.2 - handm_value * 0.01 - airvalue * 0.5;
    String strPrice = final_price.toStringAsFixed(2);
    return Scaffold(
      appBar: AppbarWidget(),
      drawer: DrawerScreen(),
      body: BackgroundContainerWidget(
        opacity: 0.3,
        x: 7.0,
        y: 7.0,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //Order list need to be added
              Container(
                  height: 120,
                  color: const Color.fromARGB(255, 240, 232, 232),
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 8, bottom: 15),
                  child: SingleChildScrollView(
                    child: Column(
                      children: data.map((data1) {
                        return PaymentCart(
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
                      '\$ $strPrice',
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
              ExpansionTile(
                initiallyExpanded: initiallyExpanded,
                controller: controller,
                title: Container(
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(7)),
                      gradient: LinearGradient(colors: [
                        Color.fromRGBO(255, 136, 102, 0.67),
                        Color.fromRGBO(255, 221, 136, 0.28),
                      ])),
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 0.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            "assets/images/swap.png",
                            height: 50,
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
                children: [
                  Column(
                    children: [
                      //                                                        ITC International
                      CompanyName(
                        companyName: "ITC International",
                        companyLogo: "assets/images/itc.png",
                        value: itcvalue,
                        points: 5,
                        factor: 0.2,
                        child: Slider(
                          divisions: 100,
                          label: " ${itcvalue.toString()}/100",
                          activeColor: Colors.black54,
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

                      //                                                        H&M
                      CompanyName(
                        companyName: "H&M",
                        companyLogo: "assets/images/h&m.png",
                        value: handm_value,
                        points: 100,
                        factor: 0.01,
                        child: Slider(
                          divisions: 100,
                          label: " ${handm_value.toString()}/100",
                          activeColor: Colors.black54,
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

                      //                                                         Emirates

                      CompanyName(
                        companyName: "Emirates",
                        companyLogo: "assets/images/air.png",
                        value: airvalue,
                        points: 2,
                        factor: 0.5,
                        child: Slider(
                          divisions: 100,
                          label: " ${airvalue.toString()}/100",
                          activeColor: Colors.black54,
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

                      //                                                    Confirmation button

                      Padding(
                        padding: const EdgeInsets.only(
                          top: 25,
                          bottom: 10,
                        ),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              if (controller.isExpanded) {
                                controller.collapse();
                              }
                            });

                            if (final_price < 0) {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return MyPopUp(
                                      bgcolor: Colors.red,
                                      textMsg:
                                          "Warning : You used access Loyalty points then required",
                                      logo: "assets/images/mistake.png",
                                      bottomHeight: 100);
                                },
                              );
                            } else if (final_price == 0) {
                              Navigator.pushNamed(context, "/loading");
                            } else {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return MyPopUp(
                                      bgcolor: Colors.greenAccent,
                                      textMsg:
                                          "Thank you for using SWAP \n Continue with UPI/Card",
                                      logo: "assets/images/smile.png",
                                      bottomHeight: 100);
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
                                    color:
                                        const Color.fromARGB(255, 255, 106, 7)),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              //--------------------------------------------------newSwap

              const Divider(
                height: 25,
                color: Colors.black,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Other Payment Method ',
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
                ),
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
