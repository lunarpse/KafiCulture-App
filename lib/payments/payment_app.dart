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
    } else {
      ref.read(OrderProvider.notifier).add(ref.read(CargoProvider));
      ref.read(CargoProvider.notifier).empty();
    }
    Navigator.pushNamed(context, "/feedback");
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

  @override
  Widget build(BuildContext context) {
    double mediaWidth = MediaQuery.of(context).size.width;

    final data = widget.coffee == true
        ? ref.watch(CartProvider)
        : ref.watch(CargoProvider);

    double gst = ref.watch(TipProvider)["gst"];

    final tc = data.isNotEmpty ? data.map((e) => e["cost"] * 1) : [];

    final double subt = tc.length != 0
        ? tc.reduce((value, element) => value + element) + gst
        : 0;
    print("ssss $subt");
    final amount = double.parse(subt.toStringAsFixed(2));
    double final_price =
        amount - itcvalue * 0.2 - handm_value * 0.01 - airvalue * 0.5;
    print(amount);
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
                            if (final_price > 0) {
                              double dollar = amount * 84;
                              var options = {
                                'key': key,
                                'amount': 100 * dollar,
                                'name': apptitle,
                                'description': appslogan,
                              };

                              _razorpay.open(options);
                            } else {
                              Navigator.pushReplacementNamed(
                                  context, "/loading");
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
