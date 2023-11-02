// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../riverpod/state_provider.dart';

class CartItem extends ConsumerStatefulWidget {
  final data;
  const CartItem({super.key, required this.data});

  @override
  ConsumerState createState() => _MyWidgetState();
}

class _MyWidgetState extends ConsumerState<CartItem> {
  var showremove = false;
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double amount = widget.data["price"] * widget.data["quantity"];
    final amount2 = double.parse(amount.toStringAsFixed(2));

    Widget remove = Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          color: Colors.grey[200],
          child: TextButton(
              onPressed: () {
                ref.read(CartProvider.notifier).decquant(widget.data["id"]);
              },
              child: Text("Remove")),
        ),
        SizedBox(
          width: 10,
        ),
        Container(
          color: Colors.grey[200],
          child: TextButton(
              onPressed: () {
                setState(() {
                  showremove = false;
                });
              },
              child: Text("Cancel")),
        ),
      ],
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 8),
      child: Container(
        padding: EdgeInsets.all(8),
        width: 100,
        height: 130,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(10), boxShadow: [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 3,
            blurRadius: 3,
            offset: Offset(0, 3),
          )
        ]),
        child: Row(
          children: [
            Container(
              width: 115,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(widget.data["icon"]),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0, 2),
                    blurRadius: 4,
                    spreadRadius: 2,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 8,
            ),
            SizedBox(
              // color: Colors.green,
              width: 97,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.data["name"],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    "\$ $amount2",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            //         showremove
            // //             ? remove
            SizedBox(
              width: 10,
            ),
            Row(
              children: [
                Container(
                  height: 30,
                  width: 30,
                  color: Colors.grey[300],
                  child: IconButton(
                      onPressed: () {
                        if (widget.data["quantity"] == 1) {
                          setState(() {
                            showremove = true;
                          });
                        } else {
                          ref
                              .read(CartProvider.notifier)
                              .decquant(widget.data["id"]);
                        }
                      },
                      icon: Icon(
                        Icons.remove,
                        size: 15,
                      )),
                ),
                Container(
                  padding: EdgeInsets.all(8.0),
                  child: Text(widget.data["quantity"].toString()),
                ),
                Container(
                  height: 30,
                  width: 30,
                  color: Colors.grey[300],
                  child: IconButton(
                      onPressed: () {
                        ref
                            .read(CartProvider.notifier)
                            .incquant(widget.data["id"]);
                      },
                      icon: Icon(
                        Icons.add,
                        size: 15,
                      )),
                ),
              ],
            ),
            IconButton(
                onPressed: () {
                  ref
                      .watch(CartProvider.notifier)
                      .removeitem(widget.data["id"]);
                },
                icon: Icon(
                  Icons.delete,
                  size: 28,
                ))
            // showremove
            //     ? remove
          ],
        ),
      ),
    );
    // return Card(
    //   // elevation: 0,
    //   child: Container(
    //     height: 120,
    //     color: Colors.white,
    //     padding: const EdgeInsets.all(8.0),
    //     width: 100,
    //     margin: EdgeInsets.all(4.0),
    //     child: Row(
    //       children: [
    //         Container(
    //           width: 100,
    //           decoration: BoxDecoration(
    //             borderRadius: BorderRadius.circular(50),
    //             image: DecorationImage(
    //                 fit: BoxFit.cover, image: AssetImage(widget.data["icon"])),
    //             boxShadow: const [
    //               BoxShadow(
    //                 color: Colors.grey,
    //                 offset: Offset(0, 2),
    //                 blurRadius: 4,
    //                 spreadRadius: 2,
    //               ),
    //             ],
    //           ),
    //         ),
    //         SizedBox(width: 16),
    //         Expanded(
    //           child: Padding(
    //             padding: const EdgeInsets.only(right: 16.0),
    //             child: Column(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               mainAxisAlignment: MainAxisAlignment.center,
    //               children: [
    //                 Text(
    //                   widget.data["name"],
    //                   maxLines: 1,
    //                   overflow: TextOverflow.ellipsis,
    //                   style: TextStyle(
    //                     fontWeight: FontWeight.bold,
    //                     fontSize: 18,
    //                   ),
    //                 ),
    //                 Text(
    //                   "\$ $amount2",
    //                   style: TextStyle(
    //                     fontWeight: FontWeight.bold,
    //                     fontSize: 15,
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ),
    //         showremove
    //             ? remove
    // : Row(
    //     children: [
    //       Container(
    //         height: 30,
    //         width: 30,
    //         color: Colors.grey[300],
    //         child: IconButton(
    //             onPressed: () {
    //               if (widget.data["quantity"] == 1) {
    //                 setState(() {
    //                   showremove = true;
    //                 });
    //               } else {
    //                 ref
    //                     .read(CartProvider.notifier)
    //                     .decquant(widget.data["id"]);
    //               }
    //             },
    //             icon: Icon(
    //               Icons.remove,
    //               size: 15,
    //             )),
    //       ),
    //       Container(
    //         padding: EdgeInsets.all(8.0),
    //         child: Text(widget.data["quantity"].toString()),
    //       ),
    //       Container(
    //         height: 30,
    //         width: 30,
    //         color: Colors.grey[300],
    //         child: IconButton(
    //             onPressed: () {
    //               ref
    //                   .read(CartProvider.notifier)
    //                   .incquant(widget.data["id"]);
    //             },
    //             icon: Icon(
    //               Icons.add,
    //               size: 15,
    //             )),
    //       ),
    // IconButton(
    //     onPressed: () {
    //       ref
    //           .watch(CartProvider.notifier)
    //           .removeitem(widget.data["id"]);
    //     },
    //     icon: Icon(Icons.delete))
    //     ],
    //               ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
