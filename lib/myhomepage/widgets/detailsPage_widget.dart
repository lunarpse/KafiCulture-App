// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_2/cart/riverpod/state_provider.dart';

import '../../cart/screen/cart.dart';

class DetailsPageWidget extends ConsumerWidget {
  const DetailsPageWidget({
    super.key,
    required this.details,
  });

  final details;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final func = ref.read(CartProvider.notifier);
    final image = details.image;
    final name = details.name;
    final description = details.description;
    final price = details.price;
    return Padding(
      padding: EdgeInsets.all(10),
      child: ListView(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Hero(
              tag: details,
              child: Image.asset(
                "assets/images/$image.jpg",
                height: 400,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            height: 320,
            width: 500,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 2,
                    blurRadius: 3,
                    offset: Offset(0, 3),
                  )
                ]),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(name,
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                                color: Colors.grey.withOpacity(0.5),
                                blurRadius: 20,
                                offset: Offset(10, 10))
                          ])),
                  Text(description,
                      style: TextStyle(
                        fontSize: 18,
                        // fontWeight: FontWeight.bold,
                      )),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Price: \$ $price",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      func.additem({
                        "name": name,
                        "image": "assets/images/$image.jpg",
                        "price": price
                      });
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Cart(),
                          ));
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green),
                      padding: MaterialStateProperty.all(
                          EdgeInsets.symmetric(vertical: 20, horizontal: 30)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      )),
                    ),
                    icon: Icon(
                      Icons.shopping_cart_outlined,
                      color: Colors.white,
                    ),
                    label: Text(
                      "Order Now",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
