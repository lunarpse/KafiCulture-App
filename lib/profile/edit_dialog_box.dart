// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class EditDialogBox extends StatelessWidget {
  EditDialogBox({super.key});

  final formKey = GlobalKey<FormState>();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController userGmailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.only(bottom: 100),
      content: StatefulBuilder(builder: (context, setState) {
        return Container(
          width: double.maxFinite,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 55,
                      width: 55,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage("assets/images/profile.png"),
                          fit: BoxFit.cover,
                        ),
                        // border: Border.all(
                        //   // color: Colors.white,
                        //   color: Color.fromRGBO(137, 71, 37, 1),
                        //   width: 3,
                        // ),
                      ),
                    ).animate().scale(),
                    SizedBox(width: 18),
                    Container(
                      // height: 200,
                      width: 290,
                      padding: EdgeInsets.all(13),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 248, 248, 248),
                        // color: Colors.blue,
                        borderRadius: BorderRadius.circular(12),
                        // border: Border.all(
                        //   color: Color.fromRGBO(137, 71, 37, 1),
                        //   width: 1,
                        // ),
                      ),
                      child: Column(
                        children: [
                          Text(
                            "Profile",
                            style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(107, 49, 20, 1)),
                          ),
                          SizedBox(height: 10),
                          Form(
                              key: formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Name",
                                    style: TextStyle(
                                        color: Color.fromRGBO(137, 71, 37, 1),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  SizedBox(height: 5),
                                  TextFormField(
                                    controller: userNameController,
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.all(10),
                                      filled: true,
                                      fillColor: Colors.grey[300],
                                      hintText: "Enter User name",
                                      hintStyle: TextStyle(fontSize: 15),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          borderSide: BorderSide(
                                              color: Colors.grey.shade400)),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(7),
                                        borderSide: BorderSide(
                                            color:
                                                Color.fromRGBO(137, 71, 37, 1)),
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Please enter User name";
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  Text(
                                    "Gmail",
                                    style: TextStyle(
                                        color: Color.fromRGBO(107, 49, 20, 1),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  SizedBox(height: 5),
                                  TextFormField(
                                    controller: userGmailController,
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.all(10),
                                      filled: true,
                                      fillColor: Colors.grey[300],
                                      hintText: "Enter Gmail",
                                      hintStyle: TextStyle(fontSize: 15),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          borderSide: BorderSide(
                                              color: Colors.grey.shade400)),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(7),
                                        borderSide: BorderSide(
                                          color: Color.fromRGBO(107, 49, 20, 1),
                                        ),
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Please enter Gmail";
                                      } else if (!value.contains("@")) {
                                        return "Gmail format is incorrect";
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(height: 18),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            Color.fromRGBO(137, 71, 37, 1),
                                        fixedSize: Size(
                                            MediaQuery.of(context).size.width,
                                            45),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(7))),
                                    onPressed: () {
                                      if (formKey.currentState!.validate()) {
                                        // submitForm();
                                        // formKey.currentState!.reset();
                                        Navigator.pop(context);
                                      }
                                    },
                                    child: Text(
                                      "Save Changes",
                                      style: TextStyle(
                                        fontSize: 15,
                                        // fontWeight: FontWeight,
                                      ),
                                    ),
                                  )
                                ],
                              ))
                        ],
                      ),
                    ).animate().slideX(duration: 300.ms, begin: -0.1),
                  ].animate(interval: 80.ms).fade(duration: 300.ms)),
            ],
          ),
        );
      }),
    );
  }
}
