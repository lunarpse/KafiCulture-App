import 'package:flutter/material.dart';
import 'package:project_2/cart/screen/cart.dart';

// ignore: camel_case_types
class drawerScreen extends StatelessWidget {
  const drawerScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: const Text('Home'),
            textColor: Colors.black87,
            trailing: const Icon(Icons.home),
            onTap: () {},
          ),
          const ListTile(
            title: Text('Inbox'),
            textColor: Colors.black87,
            trailing: Icon(Icons.inbox),
          ),
          ListTile(
            title: const Text('Sent'),
            textColor: Colors.black87,
            trailing: const Icon(Icons.send),
            onTap: () {},
          ),
          ListTile(
            title: const Text('starred'),
            textColor: Colors.black87,
            trailing: const Icon(Icons.star_border),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Spam'),
            textColor: Colors.black87,
            trailing: const Icon(Icons.dangerous),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Cart'),
            textColor: Colors.black87,
            trailing: const Icon(Icons.shopping_cart),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Cart()));
            },
          ),
        ],
      ),
    );
  }
}
