import 'package:flutter/material.dart';

// ignore: camel_case_types
class Address extends StatelessWidget {
  Address({super.key, required this.data});

  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController =
        TextEditingController(text: data["name"].toString());
    final TextEditingController emailController =
        TextEditingController(text: data["email_id"].toString());
    final TextEditingController MobileController =
        TextEditingController(text: data["mobile_number"].toString());
    final TextEditingController add1Controller =
        TextEditingController(text: data["address1"].toString());
    final TextEditingController add2Controller =
        TextEditingController(text: data["address2"].toString());
    final TextEditingController cityController =
        TextEditingController(text: data["city"].toString());
    final TextEditingController pinController =
        TextEditingController(text: data["pin_code"].toString());

    return Scaffold(
        // backgroundColor: Colors.white,
        appBar: AppBar(
          // backgroundColor: Colors.white,
          title: const Text(
            "Delivery Address",
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Name",
                    // "$data",
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: nameController,
                    enabled: false,
                    decoration: InputDecoration(
                        hintText: 'Enter the name',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Email',
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                        hintText: 'Enter the E-mail Address',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Mobile Number',
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: MobileController,
                    decoration: InputDecoration(
                        hintText: 'Enter the Mobile Number',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Address Line 1',
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: add1Controller,
                    enabled: false,
                    decoration: InputDecoration(
                        hintText: 'Enter the Address line 1',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                  const SizedBox(height: 10),
                  Column(
                    children: [
                      const Text(
                        'Address line 2 (optional)',
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: add2Controller,
                        enabled: false,
                        decoration: InputDecoration(
                            hintText: 'Enter the Address line 2',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15))),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "City",
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(
                            width: 160,
                          ),
                          Text(
                            "Pincode",
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                controller: cityController,
                                enabled: false,
                                decoration: InputDecoration(
                                    hintText: 'Enter the city name',
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15))),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                controller: pinController,
                                enabled: false,
                                decoration: InputDecoration(
                                    hintText: 'Enter the Pincode',
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15))),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Center(
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          Navigator.pushNamed(context, '/payment');
                        },
                        child: const Text(
                          'SAVE ADDRESS',
                          style: TextStyle(fontSize: 20),
                        )),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
