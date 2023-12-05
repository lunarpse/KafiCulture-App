import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: camel_case_types
class DrawerScreen extends StatefulWidget {
  const DrawerScreen({
    super.key,
  });

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  var colorr = LinearGradient(colors: [
    Color.fromARGB(117, 243, 212, 150),
    Color.fromARGB(117, 165, 118, 38),
  ]);
  @override
  Widget build(BuildContext context) {
    const double fontsize = 22;
    const double fontsize2 = 19.6;
    const double fontsize3 = 17.2;

    return Drawer(
      child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromARGB(117, 241, 216, 165),
          Color.fromARGB(117, 170, 163, 151),
          Color.fromARGB(117, 220, 182, 104),
        ])),
        child: ListView(
          children: [
            // SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.asset(
                "assets/images/logo1.png",
                height: 150,
              ),
            ),
            Divider(
              color: Colors.black12,
              thickness: 5,
            ),
            ListTile(
              title: const Text(
                'Cart',
                style: TextStyle(fontSize: fontsize),
              ),
              textColor: Colors.black87,
              trailing: const Icon(Icons.shopping_cart),
              onTap: () {
                Navigator.pushReplacementNamed(context, "/cart");
              },
            ),

            ListTile(
              title: const Text(
                'Home',
                style: TextStyle(
                  fontSize: fontsize,
                ),
              ),
              textColor: Colors.black87,
              trailing: const Icon(Icons.home),
              onTap: () {
                Navigator.pushReplacementNamed(context, "/home");
              },
            ),
            Theme(
              data: Theme.of(context).copyWith(
                dividerColor: Colors.transparent,
                //listTileTheme: ListTileThemeData(tileColor: color)
              ),
              child: ExpansionTile(
                title: Text(
                  "Cateogries",
                  style: TextStyle(fontSize: fontsize),
                ),
                children: [
                  ExpansionTile(
                    textColor: Color.fromARGB(255, 94, 27, 3),
                    title: Text(
                      "Food",
                      style: TextStyle(fontSize: fontsize2),
                    ),
                    children: [
                      // Divider(thickness: 2, color: Colors.black),
                      Container(
                        decoration: BoxDecoration(gradient: colorr),
                        child: ListTile(
                          title: const Text(
                            'Snacks',
                            style: TextStyle(fontSize: fontsize3),
                          ),
                          textColor: Colors.black87,
                          trailing: const Icon(Icons.breakfast_dining),
                          onTap: () {
                            Navigator.pushReplacementNamed(context, "/snacks");
                          },
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(gradient: colorr),
                        child: ListTile(
                          // tileColor: color,
                          title: const Text(
                            'Drinks',
                            style: TextStyle(fontSize: fontsize3),
                          ),
                          textColor: Colors.black87,
                          trailing: const Icon(Icons.local_drink),
                          onTap: () {
                            Navigator.pushReplacementNamed(context, "/drinks");
                          },
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(gradient: colorr),
                        child: ListTile(
                          // tileColor: color,
                          title: const Text(
                            'Cookies',
                            style: TextStyle(fontSize: fontsize3),
                          ),
                          textColor: Colors.black87,
                          trailing: const Icon(Icons.cookie),
                          onTap: () {
                            Navigator.pushReplacementNamed(context, "/cookies");
                          },
                        ),
                      ),
                    ],
                  ),
                  ExpansionTile(
                    title:
                        Text("Apparels", style: TextStyle(fontSize: fontsize2)),
                    children: [
                      Container(
                        decoration: BoxDecoration(gradient: colorr),
                        child: ListTile(
                          title: const Text(
                            'Men',
                            style: TextStyle(fontSize: fontsize3),
                          ),
                          textColor: Colors.black87,
                          trailing: FaIcon(
                            FontAwesomeIcons.shirt,
                          ),
                          onTap: () {
                            Navigator.pushReplacementNamed(context, "/snacks");
                          },
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(gradient: colorr),
                        child: ListTile(
                          title: const Text(
                            'Women',
                            style: TextStyle(fontSize: fontsize3),
                          ),
                          textColor: Colors.black87,
                          trailing: FaIcon(
                            FontAwesomeIcons.shirt,
                          ),
                          onTap: () {
                            Navigator.pushReplacementNamed(context, "/drinks");
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
