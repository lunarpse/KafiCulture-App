import 'package:flutter/material.dart';
import 'package:project_2/appbar/appbar_widget.dart';
import 'package:project_2/constants/color_constants.dart';
import 'package:project_2/homepage/reusable_widgets/background_container_widget.dart';
import 'package:project_2/payments/payment_app.dart';

// ignore: camel_case_types
class Address extends StatelessWidget {
  Address({super.key, required this.data, required this.coffee});
  final coffee;

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
      appBar: AppbarWidget(),
      body: BackgroundContainerWidget(
          opacity: 0.5,
          x: 7.0,
          y: 7.0,
          child: SingleChildScrollView(
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
                    Column(
                      children: <Widget>[
                        // TextButton(onPressed: () {}, child: Text('Edit')),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Address ',
                              style: TextStyle(fontSize: 20),
                            ),
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Edit',
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 18),
                                )),
                          ],
                        ),

                        TextFormField(
                          controller: add1Controller,
                          decoration: InputDecoration(
                              hintText: 'Enter the Address line 1',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15))),
                        ),
                        const SizedBox(height: 10),
                        Column(
                          children: [
                            // const Text(
                            //   'Address line 2 (optional)',
                            //   style: TextStyle(fontSize: 20),
                            // ),
                            // const SizedBox(height: 10),
                            TextFormField(
                              controller: add2Controller,
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
                      ],
                    ),
                    const SizedBox(height: 30),
                    Center(
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  (feedbackcollapsebgcolor))),
                          onPressed: () {
                            Navigator.of(context).pop();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        PaymentApp(coffee: coffee)));
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
          )),
    );
  }
}
