import 'package:flutter/material.dart';
import 'package:project_2/appbar/appbar_widget.dart';
import 'package:project_2/constants/color_constants.dart';
import 'package:project_2/homepage/reusable_widgets/background_container_widget.dart';

// ignore: camel_case_types
class Address extends StatefulWidget {
  Address({super.key, required this.data});

  final Map<String, dynamic> data;

  @override
  State<Address> createState() => _AddressState();
}

class _AddressState extends State<Address> {
  bool isEditable = false;
  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController =
        TextEditingController(text: widget.data["name"].toString());
    final TextEditingController emailController =
        TextEditingController(text: widget.data["email_id"].toString());
    final TextEditingController MobileController =
        TextEditingController(text: widget.data["mobile_number"].toString());
    final TextEditingController add1Controller =
        TextEditingController(text: widget.data["address1"].toString());
    final TextEditingController add2Controller =
        TextEditingController(text: widget.data["address2"].toString());
    final TextEditingController cityController =
        TextEditingController(text: widget.data["city"].toString());
    final TextEditingController pinController =
        TextEditingController(text: widget.data["pin_code"].toString());
    final TextEditingController stateController =
        TextEditingController(text: widget.data["state"].toString());
    final TextEditingController countryController =
        TextEditingController(text: widget.data["country"].toString());
    final TextEditingController controller = TextEditingController();

    @override
    void dispose() {
      add1Controller.dispose();
      add2Controller.dispose();
      cityController.dispose();
      pinController.dispose();
      stateController.dispose();
      countryController.dispose();
      super.dispose();
    }

    return Scaffold(
      appBar: AppbarWidget(),
      body: BackgroundContainerWidget(
          opacity: 0.4,
          x: 9.0,
          y: 9.0,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Address ',
                              style: TextStyle(fontSize: 20),
                            ),
                            TextButton(
                                onPressed: () {
                                  setState(() {
                                    isEditable = !isEditable;
                                  });
                                },
                                // ignore: prefer_const_constructors
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
                          enabled: isEditable,
                        ),
                        const SizedBox(height: 10),
                        Column(
                          children: [
                            TextFormField(
                              controller: add2Controller,
                              enabled: isEditable,
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
                                      enabled: isEditable,
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
                                      enabled: isEditable,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "State",
                                  style: TextStyle(fontSize: 20),
                                ),
                                SizedBox(
                                  width: 160,
                                ),
                                Text(
                                  "Country",
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
                                      controller: stateController,
                                      enabled: isEditable,
                                      decoration: InputDecoration(
                                          hintText: 'Enter the state name',
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
                                      controller: countryController,
                                      enabled: isEditable,
                                      decoration: InputDecoration(
                                          hintText: 'Enter the Country',
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
                            Navigator.pushNamed(context, '/payment');
                          },
                          child: const Text(
                            'SAVE ADDRESS',
                            style: TextStyle(fontSize: 20, color: Colors.white),
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
