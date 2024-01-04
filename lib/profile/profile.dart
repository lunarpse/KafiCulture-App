// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:project_2/appbar/appbar_widget.dart';
import 'package:project_2/customdrawer/drawerScreen.dart';
import 'package:project_2/homepage/reusable_widgets/background_container_widget.dart';
import 'package:project_2/profile/profile_menu_item.dart';

class Profile extends StatefulWidget {
  Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var name = "John Doe";

  var email = "johndoe@gmail.com";

  @override
  Widget build(BuildContext context) {
    var namecontroller = TextEditingController(text: name);
    var emailcontroller = TextEditingController(text: email);
    return Scaffold(
      appBar: AppbarWidget(),
      drawer: DrawerScreen(),
      body: BackgroundContainerWidget(
        opacity: 0.7,
        x: 2.0,
        y: 2.0,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Container(
                height: 330,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20))),
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Container(
                          alignment: AlignmentDirectional(0, -0.8),
                          height: 330 / 2,
                          child: Text(
                            "Profile",
                            style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.w600,
                              color: Color.fromRGBO(107, 49, 20, 1),
                            ),
                          ),
                        ),
                        Container(
                          height: 330 / 2,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 4,
                                    spreadRadius: 2,
                                    offset: Offset(0, 2))
                              ],
                              // color: Color.fromRGBO(137, 71, 37, 1),
                              color: Color.fromRGBO(134, 67, 33, 1),
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20))),
                        ),
                      ],
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 55),
                          Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image:
                                      AssetImage("assets/images/profile.png"),
                                  fit: BoxFit.cover,
                                ),
                                border:
                                    Border.all(color: Colors.white, width: 6)),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            name,
                            style: TextStyle(fontSize: 22, color: Colors.white),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            email,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                          TextButton.icon(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return BackdropFilter(
                                        filter: ImageFilter.blur(
                                            sigmaX: 10, sigmaY: 11),
                                        child: Container(
                                          width: 400,
                                          height: 40,
                                          child: Dialog(
                                            child: Container(
                                              padding: EdgeInsets.all(10),
                                              width: 400,
                                              height: 170,
                                              child: Column(
                                                children: [
                                                  TextFormField(
                                                    controller: namecontroller,
                                                  ),
                                                  TextFormField(
                                                    controller: emailcontroller,
                                                  ),
                                                  TextButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          name = namecontroller
                                                              .text;
                                                          email =
                                                              emailcontroller
                                                                  .text;
                                                          Navigator.of(context)
                                                              .pop();
                                                        });
                                                      },
                                                      child: Text("Submit"))
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    });
                              },
                              icon: Icon(
                                Icons.edit,
                                size: 15,
                                color: Colors.cyan,
                              ),
                              label: Text(
                                "Edit",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.cyan,
                                ),
                              ))
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 370,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 4,
                          spreadRadius: 2,
                          offset: Offset(0, 2))
                    ],
                    border: Border.all(
                      color: Color.fromRGBO(137, 71, 37, 1),
                      width: 1,
                    ),
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(20))),
                child: Column(
                  children: [
                    ProfileMenuItem(
                      title: "My Orders",
                      iconName: Icons.shopping_bag,
                      pressed: () {
                        Navigator.pushNamed(context, "/myOrders");
                      },
                    ),
                    ProfileMenuItem(
                      title: "Saved Recipes",
                      iconName: Icons.bookmark,
                      pressed: () {},
                    ),
                    ProfileMenuItem(
                      title: "Settings",
                      iconName: Icons.settings,
                      pressed: () {},
                    ),
                    ProfileMenuItem(
                      title: "Help",
                      iconName: Icons.info,
                      pressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
