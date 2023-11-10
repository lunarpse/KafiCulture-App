// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:project_2/cart/cart_riverpod/state_provider.dart';
import 'package:project_2/cart/riverpod/state_provider.dart';

import 'background_container_widget.dart';

// import '../../cart/cart_screen/cart.dart';

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
    return BackgroundContainerWidget(
      child: Padding(
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
            Container(
              decoration: BoxDecoration(),
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
                      blurRadius: 3,
                      spreadRadius: 2,
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
                          color: Color.fromARGB(250, 255, 191, 0),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {
                            func.additem({
                              "name": name,
                              "image": "assets/images/$image.jpg",
                              "price": price
                            });
                            Navigator.pushNamed(context, '/cart');
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                const Color.fromARGB(255, 111, 78, 55)),
                            padding: MaterialStateProperty.all(
                                EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 25)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            )),
                          ),
                          icon: Icon(
                            Icons.shopping_bag_outlined,
                            color: Colors.amber,
                          ),
                          label: Text(
                            "Order Now",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        OutlinedButton.icon(
                          onPressed: () {
                            func.additem({
                              "name": name,
                              "image": "assets/images/$image.jpg",
                              "price": price
                            });

                            var snackbar = SnackBar(
                              content: Text(
                                "$name added to Cart",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 111, 78, 55),
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                              ),
                              duration: Duration(seconds: 2),
                              backgroundColor: Colors.amber,
                              padding: EdgeInsets.all(20),
                              behavior: SnackBarBehavior.floating,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            );

                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackbar);
                          },
                          icon: Icon(
                            Icons.shopping_cart,
                            color: Colors.amber,
                          ),
                          label: Text(
                            "Add To Cart",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w900,
                                color: Color.fromARGB(255, 111, 78, 55)),
                          ),
                          style: ButtonStyle(
                              padding: MaterialStateProperty.all(
                                  EdgeInsets.symmetric(
                                      vertical: 20, horizontal: 15)),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              )),
                              side: MaterialStatePropertyAll(BorderSide(
                                  color: Color.fromARGB(255, 111, 78, 55),
                                  width: 3))),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
