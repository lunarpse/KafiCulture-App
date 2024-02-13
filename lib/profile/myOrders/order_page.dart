// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project_2/appbar/appbar_widget.dart';
import 'package:project_2/cart/riverpod/cargo_state_provider.dart';
import 'package:project_2/cart/riverpod/order_provider.dart';
import 'package:project_2/cart/riverpod/state_provider.dart';
import 'package:project_2/customdrawer/drawerScreen.dart';

import '../../homepage/reusable_widgets/background_container_widget.dart';

class MyOrders extends ConsumerWidget {
  const MyOrders({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.read(OrderProvider);
    Widget no_order = Center(
        child: Text(
      "Nothing Order",
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
    ));
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppbarWidget(
        incart: false,
      ),
      drawer: DrawerScreen(),
      body: BackgroundContainerWidget(
        child: data.length == 0
            ? no_order
            : ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(13),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 155,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 248, 248, 248),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade500,
                              blurRadius: 4,
                              spreadRadius: 2,
                              offset: Offset(0, 2))
                        ],
                        border: Border.all(
                          color: Colors.grey.shade400,
                          width: 0.5,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 60,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(13),
                                      image: DecorationImage(
                                          image:
                                              AssetImage(data[index]["icon"]),
                                          fit: BoxFit.cover)),
                                ),
                                SizedBox(width: 13),
                                Container(
                                  width: 190,
                                  height: 80,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        data[index]["name"],
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 19,
                                            fontWeight: FontWeight.bold,
                                            color:
                                                Color.fromRGBO(107, 49, 20, 1)),
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            FontAwesomeIcons.dollarSign,
                                            size: 21,
                                            color:
                                                Color.fromRGBO(137, 71, 37, 1),
                                          ),
                                          SizedBox(width: 3),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              // Text(
                                              //   "Price",
                                              //   style: TextStyle(
                                              //       fontSize: 15,
                                              //       fontWeight:
                                              //           FontWeight.w600,
                                              //       color:
                                              //           Colors.grey.shade500),
                                              // ),
                                              Text(
                                                data[index]["cost"].toString(),
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color.fromRGBO(
                                                        137, 71, 37, 1)),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                // IconButton(
                                //     onPressed: () {},
                                //     icon: Icon(
                                //       Icons.arrow_forward_ios,
                                //       size: 16,
                                //       color: Color.fromRGBO(107, 49, 20, 1),
                                //     ))
                              ],
                            ),
                            // SizedBox(
                            //   height: 1,
                            // ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        FontAwesomeIcons.tag,
                                        size: 23,
                                        color: Color.fromRGBO(137, 71, 37, 1),
                                      ),
                                      SizedBox(width: 5),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Order",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.grey.shade500),
                                          ),
                                          SizedBox(height: 3),
                                          Text(
                                            "CWT00$index",
                                            style: TextStyle(
                                                fontSize: 19,
                                                fontWeight: FontWeight.w600,
                                                color: Color.fromRGBO(
                                                    137, 71, 37, 1)),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        FontAwesomeIcons.truckFast,
                                        size: 23,
                                        color: Color.fromRGBO(137, 71, 37, 1),
                                      ),
                                      SizedBox(width: 15),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Delievery By",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.grey.shade500),
                                          ),
                                          SizedBox(height: 1),
                                          Text(
                                            "01 Jan 2024",
                                            style: TextStyle(
                                                fontSize: 19,
                                                letterSpacing: -0.4,
                                                fontWeight: FontWeight.w600,
                                                color: Color.fromRGBO(
                                                    137, 71, 37, 1)),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
