import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../BottomNav/custom_bottom_nav_bar.dart';
import '../cart/screen/cart.dart';
import '../controller/page_index.dart';
import '../login/loginscreen.dart';
import '../myhomepage/pages/home_page.dart';
import '../payments/payment_app.dart';

class MainScreen extends ConsumerWidget {
   MainScreen({super.key});
  final List<Widget> pageList = const [
    HomePage(),
    PaymentApp(),
    // MyHomePage(),
    
    LoginScreen()
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageIndex = ref.watch(pageIndexProvider) as int;
    print(pageIndex);
    return Scaffold(
      body: pageList[pageIndex],
      backgroundColor: const Color(0xFFE2E2E2),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
