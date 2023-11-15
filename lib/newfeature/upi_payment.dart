import 'package:flutter/material.dart';
import 'package:project_2/newfeature/upi_icon.dart';

class UPIPayment extends StatefulWidget {
  UPIPayment({super.key});

  static final upiFormKey = GlobalKey<FormState>();

  @override
  State<UPIPayment> createState() => _UPIPaymentState();
}

class _UPIPaymentState extends State<UPIPayment> {
  final upiController = TextEditingController();

  String btnText = "Verify";
  String snackText = "Verified";

  Color btnColor = Colors.white;
  Color btnTextColor = Colors.blueAccent;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(
        title: const Text("UPI"),
        children: [
          const Row(
            children: [
              UpiIcon(height: 90, width: 90, assets: "assets/images/gpay2.png"),
              UpiIcon(
                  height: 90, width: 90, assets: "assets/images/phonepe2.png"),
              UpiIcon(
                  height: 90, width: 90, assets: "assets/images/paytm2.png"),
              UpiIcon(height: 90, width: 90, assets: "assets/images/bhim2.png"),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              margin: const EdgeInsets.only(bottom: 15),
              child: Column(
                children: [
                  Form(
                    key: UPIPayment.upiFormKey,
                    child: TextFormField(
                      // controller: upiController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter valid UPI";
                        } else {
                          var snackbar = SnackBar(
                            content: Text(
                              "$snackText ✔",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            duration: Duration(seconds: 2),
                            backgroundColor: Colors.greenAccent,
                            dismissDirection: DismissDirection.up,
                            margin: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).size.height - 175,
                                left: 40,
                                right: 10),
                            padding: EdgeInsets.all(20),
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          );

                          ScaffoldMessenger.of(context).showSnackBar(snackbar);

                          setState(() {
                            btnText = "Pay Now";
                            btnColor = Colors.greenAccent;
                            btnTextColor = Colors.white;
                            snackText = "Payment Done";
                          });
                        }
                      },
                      maxLength: 20,
                      // keyboardType: TextInputType.emailAddress,
                      textAlign: TextAlign.start,
                      style: const TextStyle(fontSize: 16),

                      // autofillHints: Characters(""),
                      decoration: InputDecoration(
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Image.asset(
                              "assets/images/upi.jpg",
                              // height: 10,
                              width: 70,
                              fit: BoxFit.fill,
                            ),
                          ),
                          labelText: "johndoe@xyz/9XXXXXXX99@xyz",
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black54),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          )),
                    ),
                  ),
                  OutlinedButton(
                      style: ButtonStyle(
                          minimumSize: MaterialStatePropertyAll(Size(100, 43)),
                          backgroundColor: MaterialStatePropertyAll(btnColor)),
                      onPressed: () {
                        if (btnColor == Colors.greenAccent &&
                            btnText == "Pay Now") {
                          Navigator.pushReplacementNamed(context, "/loading");
                        }
                        if (UPIPayment.upiFormKey.currentState!.validate()) {
                          // var snackbar = SnackBar(
                          //   content: const Text(
                          //     "Verified ✔",
                          //     style: TextStyle(
                          //       color: Colors.white,
                          //       fontSize: 18,
                          //       fontWeight: FontWeight.bold,
                          //     ),
                          //   ),
                          //   duration: Duration(seconds: 2),
                          //   backgroundColor: Colors.greenAccent,
                          //   dismissDirection: DismissDirection.up,
                          //   margin: EdgeInsets.only(
                          //       bottom:
                          //           MediaQuery.of(context).size.height - 175,
                          //       left: 40,
                          //       right: 10),
                          //   padding: EdgeInsets.all(20),
                          //   behavior: SnackBarBehavior.floating,
                          //   shape: RoundedRectangleBorder(
                          //       borderRadius: BorderRadius.circular(10)),
                          // );

                          // ScaffoldMessenger.of(context).showSnackBar(snackbar);
                        }
                      },
                      child: Text(
                        btnText,
                        style: TextStyle(color: btnTextColor),
                      ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
