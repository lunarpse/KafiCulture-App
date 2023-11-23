import 'package:flutter/material.dart';

// ignore: camel_case_types
class DrawerScreen extends StatelessWidget {
  const DrawerScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromARGB(117, 199, 159, 80),
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
                'Home',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              textColor: Colors.black87,
              trailing: const Icon(Icons.home),
              onTap: () {
                Navigator.pushReplacementNamed(context, "/home");
              },
            ),
            ListTile(
              title: const Text(
                'Snacks',
                style: TextStyle(fontSize: 18),
              ),
              textColor: Colors.black87,
              trailing: const Icon(Icons.breakfast_dining),
              onTap: () {
                Navigator.pushReplacementNamed(context, "/snacks");
              },
            ),
            ListTile(
              title: const Text(
                'Drinks',
                style: TextStyle(fontSize: 18),
              ),
              textColor: Colors.black87,
              trailing: const Icon(Icons.local_drink),
              onTap: () {
                Navigator.pushReplacementNamed(context, "/drinks");
              },
            ),
            ListTile(
              title: const Text(
                'Cookies',
                style: TextStyle(fontSize: 18),
              ),
              textColor: Colors.black87,
              trailing: const Icon(Icons.cookie),
              onTap: () {
                Navigator.pushReplacementNamed(context, "/cookies");
              },
            ),
            ListTile(
              title: const Text(
                'Cart',
                style: TextStyle(fontSize: 18),
              ),
              textColor: Colors.black87,
              trailing: const Icon(Icons.shopping_cart),
              onTap: () {
                Navigator.pushReplacementNamed(context, "/cart");
              },
            ),
          ],
        ),
      ),
    );
  }
}
