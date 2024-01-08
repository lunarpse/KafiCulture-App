// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:project_2/constants/color_constants.dart';
import 'package:project_2/constants/text_constants.dart';

class DrawerScreen extends ConsumerStatefulWidget {
  const DrawerScreen({
    super.key,
  });

  @override
  ConsumerState<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends ConsumerState<DrawerScreen> {
  var colorr = LinearGradient(colors: [
    drawerscreenlineargradientcolor,
    drawerscreenlineargradientcolor1,
  ]);
  @override
  Widget build(BuildContext context) {
    const double fontsize = 22;
    const double fontsize2 = 19.6;
    const double fontsize3 = 17.2;

    return Drawer(
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          drawerscreenboxdeclineargradient1,
          drawerscreenboxdeclineargradient2,
          drawerscreenboxdeclineargradient3,
        ])),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.asset(
                "assets/images/logo1.png",
                height: 150,
              ),
            ),
            Divider(
              color: drawerscreendivcolor,
              thickness: 5,
            ),
            ListTile(
              title: const Text(
                home,
                style: TextStyle(
                  fontSize: fontsize,
                ),
              ),
              textColor: drawerscreentextcolor,
              trailing: const Icon(Icons.home),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.pushNamed(context, "/home");
              },
            ),

            ListTile(
              title: const Text(
                cart,
                style: TextStyle(fontSize: fontsize),
              ),
              textColor: drawerscreentextcolor,
              trailing: const Icon(Icons.shopping_cart),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.pushNamed(context, "/cart");
              },
            ),
            ListTile(
              title: const Text(
                "Profile",
                style: TextStyle(fontSize: fontsize),
              ),
              textColor: drawerscreentextcolor,
              trailing: const Icon(Icons.person),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.pushNamed(context, "/profile");
              },
            ),
            Theme(
              data: Theme.of(context).copyWith(
                dividerColor: drawerscreendividercolor,
              ),
              child: ExpansionTile(
                title: const Text(
                  categories,
                  style: TextStyle(fontSize: fontsize),
                ),
                children: [
                  ExpansionTile(
                    textColor: drawerscreenexpansiontilecolor,
                    title: const Text(
                      food,
                      style: TextStyle(fontSize: fontsize2),
                    ),
                    children: [
                      // Divider(thickness: 2, color: Colors.black),
                      Container(
                        decoration: BoxDecoration(gradient: colorr),
                        child: ListTile(
                          title: const Text(
                            snacks,
                            style: TextStyle(fontSize: fontsize3),
                          ),
                          textColor: drawerscreentextcolor,
                          trailing: const Icon(Icons.breakfast_dining),
                          onTap: () {
                            Navigator.of(context).pop();
                            Navigator.pushNamed(context, "/snacks");
                          },
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(gradient: colorr),
                        child: ListTile(
                          // tileColor: color,
                          title: const Text(
                            drinks,
                            style: TextStyle(fontSize: fontsize3),
                          ),
                          textColor: drawerscreentextcolor,
                          trailing: const Icon(Icons.local_drink),
                          onTap: () {
                            Navigator.of(context).pop();
                            Navigator.pushNamed(context, "/drinks");
                          },
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(gradient: colorr),
                        child: ListTile(
                          // tileColor: color,
                          title: const Text(
                            cookies,
                            style: TextStyle(fontSize: fontsize3),
                          ),
                          textColor: drawerscreentextcolor,
                          trailing: const Icon(Icons.cookie),
                          onTap: () {
                            Navigator.of(context).pop();
                            Navigator.pushNamed(context, "/cookies");
                          },
                        ),
                      ),
                    ],
                  ),
                  ExpansionTile(
                    title: const Text(
                      apparels,
                      style: TextStyle(fontSize: fontsize2),
                    ),
                    children: [
                      Container(
                        decoration: BoxDecoration(gradient: colorr),
                        child: ListTile(
                          title: const Text(
                            apparelsmen,
                            style: TextStyle(fontSize: fontsize3),
                          ),
                          textColor: drawerscreentextcolor,
                          trailing: const FaIcon(
                            FontAwesomeIcons.shoePrints,
                          ),
                          onTap: () {
                            Navigator.of(context).pop();
                            Navigator.pushNamed(context, "/shoepage");
                          },
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(gradient: colorr),
                        child: ListTile(
                          title: const Text(
                            apparelswomen,
                            style: TextStyle(fontSize: fontsize3),
                          ),
                          textColor: drawerscreentextcolor,
                          trailing: FaIcon(
                            FontAwesomeIcons.shirt,
                          ),
                          onTap: () {
                            Navigator.of(context).pop();
                            Navigator.pushNamed(context, "/bagpage");
                          },
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
