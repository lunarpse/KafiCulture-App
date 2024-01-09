// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import "package:flutter/material.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_2/cart/riverpod/order_provider.dart';
import 'package:project_2/cart/riverpod/state_provider.dart';
import 'package:project_2/cart/riverpod/tipstate_provider.dart';
import 'package:project_2/constants/color_constants.dart';
import 'package:project_2/constants/text_constants.dart';
import 'package:project_2/customdrawer/drawerScreen.dart';
import 'package:project_2/appbar/appbar_widget.dart';
import 'package:project_2/feedBack/thankYou.dart';
import 'package:project_2/homepage/reusable_widgets/background_container_widget.dart';
import 'package:project_2/newfeature/amount.dart';
import 'package:project_2/newfeature/company_name.dart';
import 'package:project_2/newfeature/payment_cart.dart';
import '../cart/riverpod/cargo_state_provider.dart';

import 'package:razorpay_flutter/razorpay_flutter.dart';

// ignore: camel_case_types
class PaymentApp extends ConsumerStatefulWidget {
  PaymentApp({super.key, required this.coffee});
  final coffee;

  @override
  ConsumerState createState() => _PaymentAppState();
}

// ignore: camel_case_types
class _PaymentAppState extends ConsumerState<PaymentApp> {
  // ignore: unused_field, prefer_final_fields
  //SingingCharacter? _character = SingingCharacter.Paytm;

  final ExpansionTileController controller = ExpansionTileController();
  final ExpansionTileController upiExpansionController =
      ExpansionTileController();
  final Razorpay _razorpay = Razorpay();

  @override
  void initState() {
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    super.initState();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds

    if (widget.coffee == true) {
      ref.read(OrderProvider.notifier).add(ref.read(CartProvider));
      ref.read(CartProvider.notifier).empty();
      Navigator.pushNamed(context, "/feedback");
    } else {
      ref.read(OrderProvider.notifier).add(ref.read(CargoProvider));
      ref.read(CargoProvider.notifier).empty();
      Navigator.pushNamed(context, "/cargofeedback");
    }
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet was selected
  }

  @override
  void dispose() {
    _razorpay.clear(); // Removes all listeners
    super.dispose();
  }

  double itcvalue = 0;
  double handm_value = 0;
  double airvalue = 0;
  bool initiallyExpanded = true;
  double itcEquivalent = 0;
  double h_mEquivalent = 0;
  double airEquivalent = 0;
  bool isPaused = false;
  double final_value = 0;

  @override
  Widget build(BuildContext context) {
    double mediaWidth = MediaQuery.of(context).size.width;

    final data = widget.coffee == true
        ? ref.watch(CartProvider)
        : ref.watch(CargoProvider);

    final tc = data.isNotEmpty ? data.map((e) => e["cost"] * 1) : [];

    double subt =
        tc.length != 0 ? tc.reduce((value, element) => value + element) : 0;
    final double gst = double.parse((subt * 0.05).toStringAsFixed(2));
    subt += gst;
    final_value = subt * 0.5;

    final amount = double.parse(subt.toStringAsFixed(2));
    final amount1 = double.parse(final_value.toStringAsFixed(2));
    double loyality_value = itcvalue * 0.2 + handm_value * 0.2 + airvalue * 0.5;
    double final_price = amount - loyality_value;
    double final_price1 = amount1 - loyality_value;

    String strPrice;
    if (final_price1 <= 0.00) {
      strPrice = "\$ ${amount1.toStringAsFixed(2)}";
      ;
      itcEquivalent = itcvalue * 0.2;
      h_mEquivalent = handm_value * 0.2;
      airEquivalent = airvalue * 0.5;
      loyality_value = itcvalue * 0.2 + handm_value * 0.2 + airvalue * 0.5;
      isPaused = true;
      final_value = 0;
    } else {
      itcEquivalent = itcvalue * 0.2;
      h_mEquivalent = handm_value * 0.2;
      airEquivalent = airvalue * 0.5;
      strPrice = "\$ ${final_price.toStringAsFixed(2)}";
      loyality_value = itcvalue * 0.2 + handm_value * 0.2 + airvalue * 0.5;
      final_value = final_price1;
      if (isPaused == true) {
        isPaused = false;
      }
    }

    return Scaffold(
      appBar: AppbarWidget(
        coffee: widget.coffee,
      ),
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
              SizedBox(
                height: 5,
              ),

              Padding(
                padding: EdgeInsets.only(left: 12, right: 8),
                child: Text(
                  orders,
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              LimitedBox(
                  maxHeight: 250,
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

              // SizedBox(height: 15),
              Divider(
                height: 25,
                color: paymentdivdercolor,
              ),

              ExpansionTile(
                title: Container(
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(7)),
                      gradient: LinearGradient(colors: [
                        paymentapplineargradient1,
                        paymentapplineargradient2,
                      ])),
                  height: 50,
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
                          ' ${strPrice == "-0.00" ? 0.00 : strPrice}',
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
                             print("$subt finalvalue");
                            print("$final_value finalvalue");
                            final value = newValue - itcvalue;
                            if (value > 0) {
                              if (final_value <= value * 0.2) {
                                print(value);
                                print("value is greater than final value");
                                if (itcvalue > newValue) {
                                  itcvalue = newValue;
                                } else {
                                  print("2nd else");
                                  setState(() {
                                    if (itcvalue == 0) {
                                      itcvalue = final_value * 5;
                                    } else {
                                      itcvalue = itcvalue + final_value * 5;
                                    }
                                  });
                                }
                              } else {
                                print("3rd else");
                                setState(() {
                                  itcvalue = newValue;
                                });
                              }
                            } else {
                              print("1st else");
                              setState(() {
                                itcvalue = newValue;
                              });
                            }
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
                        points: 5,
                        factor: 0.2,
                        pointsUsed: (h_mEquivalent * 5).toStringAsFixed(2),
                        child: Slider(
                          divisions: 100,
                          label: " ${handm_value.toStringAsFixed(2)}/100",
                          activeColor: companynamecolors,
                          value: handm_value.toDouble(),
                          onChanged: (double newValue) {
                            if (final_value <= newValue * 0.2) {
                              if (handm_value > newValue) {
                                handm_value = newValue;
                              } else {
                                setState(() {
                                  if (handm_value == 0) {
                                    handm_value = final_value * 5;
                                  } else {
                                    handm_value = handm_value + final_value * 5;
                                  }
                                });
                              }
                            } else {
                              setState(() {
                                handm_value = newValue;
                              });
                            }
                          },
                          //  onChangeEnd: ( double value){
                          //   if( loyality_value>subt){
                          //   setState(() {
                          //     print(final_value);
                          //     handm_value=final_value*100;
                          //   });
                          //   }
                          //   else if(loyality_value<subt){
                          //        handm_value=value;
                          //   }
                          // },
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
                            if (final_value <= newValue * 0.5) {
                              if (airvalue > newValue) {
                                airvalue = newValue;
                              } else {
                                setState(() {
                                  if (airvalue == 0) {
                                    airvalue = final_value * 2;
                                  } else {
                                    airvalue = airvalue + final_value * 2;
                                  }
                                });
                              }
                            } else {
                              setState(() {
                                airvalue = newValue;
                              });
                            }
                          },
                          //  onChangeEnd: ( double value){
                          //   if( loyality_value>subt){
                          //   setState(() {
                          //     print(final_value);
                          //     airvalue=final_value*2;
                          //   });
                          //   }
                          //   else if(loyality_value<subt){
                          //        airvalue=value;
                          //   }
                          // },
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
                            if (final_price > 0) {
                              double dollar = final_price * 84;
                              var options = {
                                'key': key,
                                'amount': 100 * dollar,
                                'name': apptitle,
                                'description': appslogan,
                              };

                              _razorpay.open(options);
                            } else {
                              if (widget.coffee == true) {
                                ref
                                    .read(OrderProvider.notifier)
                                    .add(ref.read(CartProvider));
                                ref.read(CartProvider.notifier).empty();
                                Navigator.pushNamed(context, "/feedback");
                              } else {
                                ref
                                    .read(OrderProvider.notifier)
                                    .add(ref.read(CargoProvider));
                                ref.read(CargoProvider.notifier).empty();
                                Navigator.pushNamed(context, "/cargofeedback");
                              }
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
            ],
          ),
        ),
      ),
    );
  }
}
