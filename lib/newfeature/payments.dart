// import 'package:flutter/material.dart';
// import 'package:flutter_credit_card/flutter_credit_card.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:project_2/cart/riverpod/state_provider.dart';
// import 'package:project_2/cart/widget/Tip.dart';
// import 'package:project_2/cart/widget/cart_item.dart';

// import 'package:project_2/newfeature/credit_debit_cards.dart';
// import 'package:project_2/newfeature/upi_icon.dart';

// class Payments extends ConsumerStatefulWidget {
//   @override
//   ConsumerState<Payments> createState() => _PaymentsState();
// }

// class _PaymentsState extends ConsumerState<Payments> {
//   double tipfee = 0.0;
//   final GlobalKey<FormState> formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     final data = ref.watch(CartProvider);

//     final tc = data.length != 0
//         ? data.map((e) => e["price"] * e["quantity"]).toList()
//         : [];

//     final subt =
//         tc.length != 0 ? tc.reduce((value, element) => value + element) : 0;
//     final amount = double.parse(subt.toStringAsFixed(2));
//     return Scaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               //------------------------------------------Orders

//               // Card(
//               //   child: ExpansionTile(
//               //     title: Text("Orders"),
//               //     children: [
//               //       ListView.builder(
//               //         shrinkWrap: true,
//               //         physics: NeverScrollableScrollPhysics(),
//               //         itemCount: data.length + 2,
//               //         padding: EdgeInsets.all(8),
//               //         itemBuilder: (context, index) {
//               //           if (index < data.length) {
//               //             if (data[index]["quantity"] != 0) {
//               //               return CartItem(data: data[index]);
//               //             }
//               //             return Container(
//               //               height: 0,
//               //             );

//               //             // } else if (index == data.length) {
//               //             //   // return Delievery_Instruction();
//               //             //   return InstructionCard();
//               //             // } else if (index == data.length + 1) {
//               //             //   return Column(
//               //             //     crossAxisAlignment: CrossAxisAlignment.start,
//               //             //     children: [
//               //             //       Padding(
//               //             //         padding: const EdgeInsets.symmetric(
//               //             //             horizontal: 10, vertical: 3),
//               //             //         child: Text(
//               //             //           "\$ $amount",
//               //             //           style: TextStyle(
//               //             //               fontSize: 25,
//               //             //               fontWeight: FontWeight.bold),
//               //             //         ),
//               //             //       ),
//               //             //       // Extras(),
//               //             //     ],
//               //             //   );
//               //             //   // return Extras();
//               //             // }
//               //           }
//               //         },
//               //       ),
//               //       Column(
//               //         crossAxisAlignment: CrossAxisAlignment.start,
//               //         children: [
//               //           Padding(
//               //             padding: const EdgeInsets.symmetric(
//               //                 horizontal: 10, vertical: 3),
//               //             child: Text(
//               //               "\$ $amount",
//               //               style: TextStyle(
//               //                   fontSize: 25, fontWeight: FontWeight.bold),
//               //             ),
//               //           ),
//               //           // Extras(),
//               //         ],
//               //       )
//               //     ],
//               //   ),
//               // ),

//               //-------------------------------------------SWAP

//               Card(
//                 child: ExpansionTile(
//                   title: Text("SWAP"),
//                   children: [
//                     Container(
//                       child: Row(
//                         children: [
//                           Container(
//                             width: 43,
//                             height: 43,
//                             child: Image.asset("assets/images/itc.png"),
//                           ),
//                           Container(
//                             width: 350,
//                             child: Slider(
//                               value: 100,
//                               onChanged: (value) {},
//                               max: 100,
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                     Container(
//                       child: Row(
//                         children: [
//                           Container(
//                             width: 43,
//                             height: 43,
//                             child: Image.asset("assets/images/h&m.png"),
//                           ),
//                           Container(
//                             width: 350,
//                             child: Slider(
//                               value: 100,
//                               onChanged: (value) {},
//                               max: 100,
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                     Container(
//                       child: Row(
//                         children: [
//                           Container(
//                             width: 43,
//                             height: 43,
//                             child: Image.asset("assets/images/airline.webp"),
//                           ),
//                           Container(
//                             width: 350,
//                             child: Slider(
//                               value: 100,
//                               onChanged: (value) {},
//                               max: 100,
//                             ),
//                           )
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               ),

//               //--------------------------------------------UPI

//               // Card(
//               //   child: ExpansionTile(
//               //     title: Text("UPI"),
//               //     children: [
//               //       const Row(
//               //         children: [
//               //           UpiIcon(
//               //               height: 100,
//               //               width: 100,
//               //               assets: "assets/images/gpay2.png"),
//               //           UpiIcon(
//               //               height: 100,
//               //               width: 100,
//               //               assets: "assets/images/phonepe2.png"),
//               //           UpiIcon(
//               //               height: 100,
//               //               width: 100,
//               //               assets: "assets/images/paytm2.png"),
//               //           UpiIcon(
//               //               height: 100,
//               //               width: 100,
//               //               assets: "assets/images/bhim2.png"),
//               //         ],
//               //       ),
//               //       Padding(
//               //         padding: const EdgeInsets.all(8.0),
//               //         child: Container(
//               //           margin: EdgeInsets.only(bottom: 15),
//               //           child: Column(
//               //             children: [
//               //               TextField(
//               //                 maxLength: 20,
//               //                 keyboardType: TextInputType.emailAddress,
//               //                 textAlign: TextAlign.start,
//               //                 style: TextStyle(fontSize: 16),

//               //                 // autofillHints: Characters(""),
//               //                 decoration: InputDecoration(
//               //                     prefixIcon: Padding(
//               //                       padding: EdgeInsets.all(10),
//               //                       child: Image.asset(
//               //                         "assets/images/upi.jpg",
//               //                         // height: 10,
//               //                         width: 70,
//               //                         fit: BoxFit.fill,
//               //                       ),
//               //                     ),
//               //                     labelText: "johndoe@xyz/9XXXXXXX99@xyz",
//               //                     border: OutlineInputBorder(
//               //                       borderSide:
//               //                           BorderSide(color: Colors.black54),
//               //                       borderRadius:
//               //                           BorderRadius.all(Radius.circular(10)),
//               //                     )),
//               //               ),
//               //               OutlinedButton(
//               //                   onPressed: () {}, child: Text("Verify UPI"))
//               //             ],
//               //           ),
//               //         ),
//               //       )
//               //     ],
//               //   ),
//               // ),

//               //-------------------------------------------Debit/credit card

// //               Card(
// //                 child: ExpansionTile(
// //                   title: Text("Debit/Credit card"),
// //                   children: [
// //                     CreditCardWidget(
// //                       cardNumber: "9898989898989898",
// //                       expiryDate: "77/88",
// //                       cardHolderName: "cardHolderName",
// //                       cvvCode: "XXX",
// //                       showBackView: true,
// //                       onCreditCardWidgetChange: (p0) {},
// //                     ),
// //                     CreditCardForm(
// //                         cardNumber: "cardNumber",
// //                         expiryDate: "expiryDate",
// //                         cardHolderName: "cardHolderName",
// //                         cvvCode: "cvvCode",
// //                         onCreditCardModelChange: (I) {},
// //                         formKey: formKey),
// //                     ElevatedButton(
// //                       style: ElevatedButton.styleFrom(
// //                           shape: RoundedRectangleBorder(
// //                             borderRadius: BorderRadius.circular(8.0),
// //                           ),
// //                           foregroundColor: Color(0xff1b447)),
// //                       child: Container(
// //                         margin: EdgeInsets.all(8.0),
// //                         child: const Text(
// //                           'validate',
// //                           style: TextStyle(
// //                             color: Colors.white,
// //                             fontFamily: 'halter',
// //                             fontSize: 14,
// //                             package: 'flutter_credit-card',
// //                           ),
// //                         ),
// //                       ),
// //                       onPressed: () {
// //                         if (formKey.currentState!.validate()) {
// //                           print('valid');
// //                         } else {
// //                           print('inValid');
// //                         }
// //                       },
// //                     )
// //                   ],
// //                 ),
// //               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
