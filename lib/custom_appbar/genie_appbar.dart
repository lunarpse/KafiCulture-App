import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    this.name,
    required this.child,
  });

  final String? name;
  final Widget child;

  String? titleName() {
    if (name == null) {
      return "Guest";
    } else {
      return name;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: Padding(
              padding: const EdgeInsets.all(8),
              child: CircleAvatar(
                backgroundColor: Colors.white,

                backgroundImage: AssetImage("assets/images/logo1.png"),
                // radius: 28,
              ),
            ),
            backgroundColor: const Color.fromRGBO(66, 24, 6, 1),
            floating: true,
            pinned: true,
            title: Text(
              "Welcome, ${titleName()}",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            expandedHeight: 150,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/images/coffeeApp1.jpeg",
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: child,
          )
        ],
      ),
    );
  }
}
