import 'package:flutter/material.dart';
import 'package:project_2/newfeature/upi_icon.dart';

class UPIPayment extends StatelessWidget {
  const UPIPayment({super.key});

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
                  TextField(
                    maxLength: 20,
                    keyboardType: TextInputType.emailAddress,
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
                  OutlinedButton(
                      onPressed: () {}, child: const Text("Verify UPI"))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
