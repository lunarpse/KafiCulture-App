import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ionicons/ionicons.dart';
// import 'package:genie_merger/controller/page_index.dart';

// import 'package:ionicons/ionicons.dart';

import '../controller/page_index.dart';
import 'bottom_nav_widget.dart';

class CustomBottomNavigationBar extends ConsumerWidget {
  const CustomBottomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageIndex = ref.watch(pageIndexProvider) as int;
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BottonNavWidget(
              onTap: () {
                ref.read(pageIndexProvider.notifier).pageIndex(0);
                print("Home");
              },
              data: pageIndex == 0 ? Ionicons.home : Ionicons.home_outline,
            ),
            BottonNavWidget(
              onTap: () {
                ref.read(pageIndexProvider.notifier).pageIndex(1);
                print("Search");
              },
              data: pageIndex == 1
                  ? Ionicons.search_circle_sharp
                  : Ionicons.search,
            ),
            BottonNavWidget(
              onTap: () {
                ref.read(pageIndexProvider.notifier).pageIndex(2);
                print("add");
              },
              data: pageIndex == 2 ? Ionicons.add_circle_sharp : Ionicons.add,
            ),
            BottonNavWidget(
              onTap: () {
                ref.read(pageIndexProvider.notifier).pageIndex(3);
                print("cart");
              },
              data: pageIndex == 3 ? Ionicons.cart : Ionicons.cart_outline,
            ),
            BottonNavWidget(
              onTap: () {
                ref.read(pageIndexProvider.notifier).pageIndex(4);
                print("Profile");
              },
              data: pageIndex == 4 ? Ionicons.person : Ionicons.person_outline,
            ),
          ],
        ),
      ),
    ));
  }
}
