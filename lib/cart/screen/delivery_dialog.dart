import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../delivery/address_page/address.dart';

class DeliveryDialog extends StatefulWidget {
  const DeliveryDialog({super.key});

  @override
  State<DeliveryDialog> createState() => _DeliveryDialogState();
}

class _DeliveryDialogState extends State<DeliveryDialog> {
  Future<Map<String, dynamic>> loadJson() async {
    final String jsonString =
        await rootBundle.loadString('assets/json/aadar.json');
    final jsonResponse = json.decode(jsonString);
    return jsonResponse;
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController aadharController = TextEditingController();

    void _formatAadharInput() {
      final text = aadharController.text;
      if (text.length == 4 || text.length == 9) {
        aadharController.text = '$text-';
        aadharController.selection = TextSelection.fromPosition(
          TextPosition(offset: aadharController.text.length),
        );
      }
    }

    @override
    void initState() {
      super.initState();
      aadharController.addListener(() {
        if (aadharController.text.isNotEmpty) {
          _formatAadharInput();
        }
      });
    }

    @override
    void dispose() {
      aadharController.dispose();
      super.dispose();
    }

    return AlertDialog(
        insetPadding: EdgeInsets.all(20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        content: FutureBuilder(
            future: loadJson(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                String key = '123456789012'; // 10-digit key (Aadhar number)
                var data = snapshot.data[key];
                print(data);
                var name1 = '${data['name']}';
                // return address();
                return Container(
                  width: double.maxFinite,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        keyboardType: TextInputType.number,
                        controller: aadharController,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(14),
                        ],
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[200],
                          labelText: 'Aadhar Number',
                          // hintText: 'Enter Aadhar Number',
                          //prefixText: 'XXXX-XXXX-XXXX',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        maxLength: 14,
                        onChanged: (value) {},
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Address(
                                        data: data,
                                      )));
                        },
                        child: Text("next"),
                      )
                    ],
                  ),
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }));
  }
}
