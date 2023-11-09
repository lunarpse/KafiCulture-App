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

  @override
  Widget build(BuildContext context) {
    double mediaWidth = MediaQuery.of(context).size.width;

    final data = ref.watch(CartProvider);
    double gst=ref.watch(TipProvider)["gst"];

    final tc =
        data.isNotEmpty ? data.map((e) => e["price"] * e["quantity"]) : [];

    final double subt = tc.length != 0
        ? tc.reduce((value, element) => value + element) +gst
        : 0;
    
    final amount = double.parse(subt.toStringAsFixed(2));
    return Scaffold(
      appBar: AppbarWidget(),
      body: Container(
        
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //Order list need to be added
              Container(color: const Color.fromARGB(255, 240, 232, 232),
               width: double.infinity,
              margin: EdgeInsets.only(top: 8,bottom: 15),
              child: Column(
                
                children: 
                 data.map((data1){
                  return CartItem(data: data1,atpayment: true,);
                 }).toList()
                ,
              )
              ),
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
                  "\$ $amount ",
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

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: Color.fromARGB(255, 111, 78, 55),
                  child: ExpansionTile(
                    title: Container(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
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
                            color: const Color.fromARGB(255, 154, 143, 142),
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    )),
                    children: [
                      Container(
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 15,
                            ),
                            Container(
                              width: 43,
                              height: 43,
                              child: Image.asset("assets/images/itc.png"),
                            ),
                            Container(
                              width: 300,
                              child: Slider(
                                value: 100,
                                onChanged: (value) {},
                                max: 100,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 15,
                            ),
                            Container(
                              width: 43,
                              height: 43,
                              child: Image.asset("assets/images/h&m.png"),
                            ),
                            Container(
                              width: 300,
                              child: Slider(
                                value: 100,
                                onChanged: (value) {},
                                max: 100,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 15,
                            ),
                            Container(
                              width: 43,
                              height: 43,
                              child: Image.asset("assets/images/airline.webp"),
                            ),
                            Container(
                              width: 300,
                              child: Slider(
                                value: 100,
                                onChanged: (value) {},
                                max: 100,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),

              // Center(
              //   child: LoginBtn(
              //     borderRadius: 33,
              //     btnHeight: 55,
              //     btnWidth: 300,
              //     color: Colors.black,
              //     fontSize: 20,
              //     text: "SWAP",
              //     textColor: Colors.white,
              //     onTab: () {
              //       Navigator.pushNamed(context, '/swap');
              //     },
              //     gradientColor1: Color.fromARGB(255, 111, 78, 55),
              //     gradientColor2: Color.fromARGB(255, 111, 78, 55),
              //     gradientColor3: Color.fromARGB(255, 111, 78, 55),
              //     boxShadow1: const BoxShadow(
              //         color: Color.fromARGB(255, 0, 0, 0),
              //         offset: Offset(4.0, 4.0),
              //         blurRadius: 15,
              //         spreadRadius: 1.0),
              //     boxShadow2: const BoxShadow(
              //         color: Colors.black,
              //         offset: Offset(4.0, 4.0),
              //         blurRadius: 15,
              //         spreadRadius: 1.0),
              //     boxShadow3: const BoxShadow(
              //         color: Colors.black,
              //         offset: Offset(4.0, 4.0),
              //         blurRadius: 15,
              //         spreadRadius: 1.0),
              //   ),
              // ),

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

              //---------------------------------------------UPI

              const SizedBox(height: 10),
              const Padding(
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
