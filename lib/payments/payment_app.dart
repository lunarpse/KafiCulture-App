// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_2/cart/riverpod/cargo_state_provider.dart';
import 'package:project_2/cart/riverpod/state_provider.dart';
import 'package:project_2/cart/riverpod/switch_provider.dart';
import 'package:project_2/cart/riverpod/tipstate_provider.dart';
import 'package:project_2/constants/color_constants.dart';
import 'package:project_2/constants/text_constants.dart';

import 'package:project_2/customdrawer/drawerScreen.dart';

import 'package:project_2/appbar/appbar_widget.dart';
import 'package:project_2/homepage/reusable_widgets/background_container_widget.dart';
import 'package:project_2/newfeature/amount.dart';

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
  final ExpansionTileController upiExpansionController =
      ExpansionTileController();
  double itcvalue = 0;
  double handm_value = 0;
  double airvalue = 0;
  bool initiallyExpanded = true;
  double itcEquivalent = 0;
  double h_mEquivalent = 0;
  double airEquivalent = 0;

  @override
  Widget build(BuildContext context) {
    double mediaWidth = MediaQuery.of(context).size.width;

    final data = ref.watch(SwitchProvider) == true
        ? ref.watch(CartProvider)
        : ref.watch(CargoProvider);
    double addonprice = 0;
    for (int i = 0; i < data.length; i++) {
      addonprice +=
          data[i]["addons"] == null ? 0 : data[i]["addons"]["addonprice"];
    }
    double gst = ref.watch(TipProvider)["gst"];

    final tc = data.isNotEmpty ? data.map((e) => e["cost"] * 1) : [];

    final double subt = tc.length != 0
        ? tc.reduce((value, element) => value + element) + gst + addonprice
        : 0;

    final amount = double.parse(subt.toStringAsFixed(2));
    double final_price =
        amount - itcvalue * 0.2 - handm_value * 0.01 - airvalue * 0.5;

    String strPrice;
    if (final_price < 0.00) {
      strPrice = "0.00";
    } else {
      itcEquivalent = itcvalue * 0.2;
      h_mEquivalent = handm_value * 0.01;
      airEquivalent = airvalue * 0.5;
      strPrice = "\$ ${final_price.toStringAsFixed(2)}";
    }
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
                  color: paymentcartcontainercolor,
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

              //--------------------------------------------------------Amount

              ExpansionTile(
                title: Container(
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(7)),
                      gradient: LinearGradient(colors: [
                        paymentapplineargradient1,
                        paymentapplineargradient2,
                      ])),
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          totalamount,
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          ' $strPrice',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 25,
                              color: paymentapppricecolor,
                              fontStyle: FontStyle.normal),
                        ),
                      ],
                    ),
                  ),
                ),
                children: [
                  Amount(
                    text: subtotal,
                    price: "\$ ${amount.toString()}",
                    fontSize: 20,
                    fontColor: paymentapppricecolor,
                    leftPadding: 20,
                    rightPadding: 20,
                    topPadding: 5,
                    bottomPadding: 5,
                  ),
                  ExpansionTile(
                    title: Amount(
                      text: loyalitypointequivalent,
                      price:
                          "\$ ${(airEquivalent + h_mEquivalent + itcEquivalent).toStringAsFixed(2)}",
                      fontSize: 20,
                      fontColor: loyalitypointcolor,
                      leftPadding: 5,
                      rightPadding: 0,
                      topPadding: 5,
                      bottomPadding: 5,
                    ),
                    children: [
                      Amount(
                        text: hotel1,
                        price: "\$ ${(itcEquivalent).toStringAsFixed(2)}",
                        fontSize: 18,
                        fontColor: paymentapphotelcolor,
                        leftPadding: 20,
                        rightPadding: 20,
                        topPadding: 5,
                        bottomPadding: 5,
                      ),
                      Amount(
                        text: hotel2,
                        price: "\$ ${(h_mEquivalent).toStringAsFixed(2)}",
                        fontSize: 18,
                        fontColor: paymentapphotelcolor,
                        leftPadding: 20,
                        rightPadding: 20,
                        topPadding: 5,
                        bottomPadding: 5,
                      ),
                      Amount(
                        text: hotel3,
                        price: "\$ ${(airEquivalent).toStringAsFixed(2)}",
                        fontSize: 18,
                        fontColor: paymentapphotelcolor,
                        leftPadding: 20,
                        rightPadding: 20,
                        topPadding: 5,
                        bottomPadding: 5,
                      ),
                    ],
                  ),
                ],
              ),

              SizedBox(
                height: 10,
              ),

              Padding(
                padding: EdgeInsets.only(left: 12, right: 8),
                child: Text(
                  selectpaymentmethod,
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
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
                        paymentappexpansiontilegradient1,
                        paymentappexpansiontilegradient2,
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
                              recommended,
                              style: TextStyle(
                                  fontSize: 17,
                                  color: recommendedtextcolor,
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
                        companyName: hotel1,
                        companyLogo: "assets/images/itc.png",
                        value: itcvalue,
                        points: 5,
                        factor: 0.2,
                        pointsUsed: (itcEquivalent * 5).toStringAsFixed(2),
                        child: Slider(
                          divisions: 100,
                          label: " ${itcvalue.toStringAsFixed(2)}/100",
                          activeColor: companynamecolors,
                          value: itcvalue.toDouble(),
                          onChanged: (double newValue) {
                            setState(() {
                              itcvalue = newValue;
                            });
                          },
                          min: 0,
                          max: 100,
                        ),
                      ),

                      //                                                        H&M
                      CompanyName(
                        companyName: hotel2,
                        companyLogo: "assets/images/h&m.png",
                        value: handm_value,
                        points: 100,
                        factor: 0.01,
                        pointsUsed: (h_mEquivalent * 100).toStringAsFixed(2),
                        child: Slider(
                          divisions: 100,
                          label: " ${handm_value.toStringAsFixed(2)}/100",
                          activeColor: companynamecolors,
                          value: handm_value.toDouble(),
                          onChanged: (double newValue) {
                            setState(() {
                              handm_value = newValue;
                            });
                          },
                          min: 0,
                          max: 100,
                        ),
                      ),

                      //                                                         Emirates

                      CompanyName(
                        companyName: hotel3,
                        companyLogo: "assets/images/air.png",
                        value: airvalue,
                        points: 2,
                        factor: 0.5,
                        pointsUsed: (airEquivalent * 2).toStringAsFixed(2),
                        child: Slider(
                          divisions: 100,
                          label: " ${airvalue.toStringAsFixed(2)}/100",
                          activeColor: companynamecolors,
                          value: airvalue.toDouble(),
                          onChanged: (double newValue) {
                            setState(() {
                              airvalue = newValue;
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
                              if (controller.isExpanded && final_price > 0) {
                                controller.collapse();
                                upiExpansionController.expand();
                              } else {
                                upiExpansionController.collapse();
                              }
                            });

                            if (final_price > 0) {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return MyPopUp(
                                      bgcolor: showdialogbackgroundcolor,
                                      textMsg: swapmessage,
                                      logo: "assets/images/smile.png",
                                      bottomHeight: 100);
                                },
                              );
                            } else {
                              Navigator.pushNamed(context, "/loading");
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: paymentborderall),
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                colors: [
                                  paymentborderallgradient1,
                                  paymentborderallgradient2,
                                ],
                              ),
                            ),
                            width: mediaWidth * 0.9,
                            height: 55,
                            child: Center(
                              child: Text(
                                confirm,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: confirmcolor),
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

              Divider(
                height: 25,
                color: paymentdivdercolor,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Text(
                  otherpaymentmethod,
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              //---------------------------------------------UPI

              const SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: UPIPayment(
                  upiExpansionController: upiExpansionController,
                ),
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
