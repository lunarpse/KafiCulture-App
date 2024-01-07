// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project_2/appbar/appbar_widget.dart';
import 'package:project_2/customdrawer/drawerScreen.dart';
import 'package:project_2/homepage/reusable_widgets/background_container_widget.dart';
import 'package:project_2/profile/profile_menu_item.dart';
import '../constants/color_constants.dart';
import '../constants/text_constants.dart';
import 'edit_dialog_box.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool _customIcon = false;
  var name = "John Doe";
  var email = "johndoe@gmail.com";
  @override
  Widget build(BuildContext context) {
    var namecontroller = TextEditingController(text: name);
    var emailcontroller = TextEditingController(text: email);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppbarWidget(),
      drawer: DrawerScreen(),
      body: BackgroundContainerWidget(
        opacity: 0.9,
        x: 2.0,
        y: 2.0,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Container(
                height: 330,
                decoration: BoxDecoration(
                    color: firstContainerColor,
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
                            profileHeadingText,
                            style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.w600,
                              color: profileHeadingTextColor,
                            ),
                          ),
                        ),
                        Container(
                          height: 330 / 2,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: boxShadowColor,
                                    blurRadius: 4,
                                    spreadRadius: 2,
                                    offset: Offset(0, 2))
                              ],
                              color: secondContainerColor,
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
                                border: Border.all(
                                    color: circularImageBorderColor, width: 6)),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            name,
                            style:
                                TextStyle(fontSize: 22, color: userNameColor),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            email,
                            style: TextStyle(
                              fontSize: 16,
                              color: userEmailColor,
                            ),
                          ),
                          TextButton.icon(
                              onPressed: () {
                                showDialog(
                                  barrierColor: editDialogBoxBarrierColor,
                                  context: context,
                                  builder: (context) => EditDialogBox(
                                      currentName: name,
                                      currentEmail: email,
                                      onSave: (newName, newEmail) {
                                        setState(() {
                                          name = newName;
                                          email = newEmail;
                                        });
                                      }),
                                );
                              },
                              icon: Icon(
                                Icons.edit,
                                size: 15,
                                color: editButtonIconColor,
                              ),
                              label: Text(
                                editButtonName,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: editButtonColor,
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
                    color: bigContainerColor,
                    boxShadow: [
                      BoxShadow(
                          color: boxShadowColor,
                          blurRadius: 4,
                          spreadRadius: 2,
                          offset: Offset(0, 2))
                    ],
                    border: Border.all(
                      color: bigContainerBorderColor,
                      width: 1,
                    ),
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(20))),
                child: Column(
                  children: [
                    ProfileMenuItem(
                      title: myorderText,
                      iconName: Icons.shopping_bag,
                      pressed: () {
                        Navigator.pushNamed(context, "/myOrders");
                      },
                    ),
                    ProfileMenuItem(
                      title: wishlistText,
                      iconName: Icons.bookmark,
                      pressed: () {
                        Navigator.pushNamed(context, "/wishlist");
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 7),
                      child: ExpansionTile(
                        leading: Icon(
                          Icons.settings,
                          size: 26,
                          color: settingsIconColor,
                        ),
                        title: Text(
                          settingsText,
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w600,
                            color: settingsTextColor,
                          ),
                        ),
                        trailing: Icon(
                          _customIcon
                              ? FontAwesomeIcons.angleUp
                              : FontAwesomeIcons.angleDown,
                          size: 18,
                          color: _customIcon
                              ? angleUpIconColor
                              : angleDownIconColor,
                        ),
                        onExpansionChanged: (bool expanded) {
                          setState(() => _customIcon = expanded);
                        },
                        children: [
                          InkWell(
                            onTap: () =>
                                Navigator.pushNamed(context, "/address"),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: ListTile(
                                  leading: Icon(
                                    FontAwesomeIcons.mapLocationDot,
                                    size: 23,
                                    color: addressTextIconColor,
                                  ),
                                  title: Text(
                                    addressText,
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: addressTextColor,
                                    ),
                                  ),
                                  trailing: Icon(
                                    FontAwesomeIcons.angleRight,
                                    size: 17,
                                    color: SettingsangleRightIconColor,
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ProfileMenuItem(
                      title: helpText,
                      iconName: Icons.info,
                      pressed: () {
                        Navigator.pushNamed(context, "/help");
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
