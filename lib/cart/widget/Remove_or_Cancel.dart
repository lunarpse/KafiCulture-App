import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_2/cart/riverpod/state_provider.dart';
// import 'package:project_2/hjc/cart_riverpod/state_provider.dart';
// import 'package:project_2/cart/cart/riverpod/state_provider.dart';

class Remove_or_Cancel extends ConsumerWidget {
  const Remove_or_Cancel(
      {super.key,
      required this.image,
      required this.setremove,
      required this.name});
  final Function setremove;
  final String name;
  final image;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: 100,
      height: 120,
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.black),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 87, 76, 76),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(0, 3),
            )
          ],
          borderRadius: BorderRadius.all(Radius.circular(20)),
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.fill)),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        // decoration: BoxDecoration(

        //   image: DecorationImage(image: AssetImage(image),fit: BoxFit.fill)
        // ),

        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 1, sigmaY: 3),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    ref.watch(CartProvider.notifier).remove_item(name);
                    setremove();
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      backgroundColor: Color.fromARGB(255, 19, 11, 8)),
                  child: Text("Remove")),
              SizedBox(
                width: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    setremove();
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)))),
                  child: Text("Cancel"))
            ],
          ),
        ),
      ),
    );
  }
}
