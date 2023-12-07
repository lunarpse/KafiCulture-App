// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../../constants/emptycart_constants.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.shopping_cart_checkout_outlined,size: 45,),
              SizedBox(
                width: 10,
              ),
              Text(
                emptycart,
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
              )
            ],
          ),
          SizedBox(
            height: 25,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              
              padding: EdgeInsets.symmetric(
                horizontal: 39,
                vertical: 16.0,
              ),
              primary:elevatebuttoncolor,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
                side: BorderSide(
                  color: roundedrectanglebordercolor,
                ),
              ),
            ),
            onPressed: () {},
            child: Text(
              gotohomepage,
              ),
          ),
        ],
      ),
    );
  }
}
