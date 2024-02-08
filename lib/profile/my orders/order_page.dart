// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project_2/appbar/appbar_widget.dart';
import 'package:project_2/customdrawer/drawerScreen.dart';
import '../../cart/riverpod/order_provider.dart';
import '../../constants/color_constants.dart';
import '../../constants/text_constants.dart';
import '../../homepage/reusable_widgets/background_container_widget.dart';

class MyOrders extends ConsumerWidget {
  MyOrders({super.key});

  DateTime todaysDate = DateTime.now();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.read(OrderProvider);
    print(data);
    Widget no_order = Center(
        child: Text(
      noOrderText,
      style: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 25, color: noOrderTextColor),
    ));
    return Scaffold(
        appBar: AppbarWidget(),
        drawer: DrawerScreen(),
        body: BackgroundContainerWidget(
            opacity: 0.7,
            x: 4.0,
            y: 4.0,
            child: data.length == 0
                ? no_order
                : ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return Column(
                          children: data[index]["data"]
                              .map<Widget>((e) => Padding(
                                    padding: const EdgeInsets.all(13),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        color: everyOrderContainerColor,
                                        borderRadius: BorderRadius.circular(20),
                                        gradient: LinearGradient(
                                            colors: [
                                              cartLinearGrad1,
                                              cartLinearGrad2,
                                              cartLinearGrad3
                                            ],
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight),
                                        boxShadow: [
                                          BoxShadow(
                                              color:
                                                  everyOrderContainerShadowColor,
                                              blurRadius: 1,
                                              spreadRadius: 1)
                                        ],
                                        border: Border.all(
                                          color: everyOrderContainerBorderColor,
                                          width: 0.5,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(13),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  height: 75,
                                                  width: 100,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              13),
                                                      image: DecorationImage(
                                                          image: AssetImage(
                                                              e["icon"]),
                                                          fit: BoxFit.cover)),
                                                ),
                                                SizedBox(width: 20),
                                                Container(
                                                  width: 235,
                                                  height: 80,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      Text(
                                                        e["name"],
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                circleavatarbgcolor),
                                                      ),
                                                      Row(
                                                        children: [
                                                          Icon(
                                                            FontAwesomeIcons
                                                                .dollarSign,
                                                            size: 21,
                                                            color: tagcolor,
                                                          ),
                                                          SizedBox(width: 3),
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                priceHeadingText,
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        15,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    color:
                                                                        headingcolor),
                                                              ),
                                                              Text(
                                                                e["cost"]
                                                                    .toString(),
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        17,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color:
                                                                        circleavatarbgcolor),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 6,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        FontAwesomeIcons.tag,
                                                        size: 23,
                                                        color: tagcolor,
                                                      ),
                                                      SizedBox(width: 5),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            orderHeadingText,
                                                            style: TextStyle(
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color:
                                                                    headingcolor),
                                                          ),
                                                          SizedBox(height: 3),
                                                          Text(
                                                            "CWT00$index",
                                                            style: TextStyle(
                                                                fontSize: 19,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color:
                                                                    circleavatarbgcolor),
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        FontAwesomeIcons
                                                            .truckFast,
                                                        size: 23,
                                                        color: tagcolor,
                                                      ),
                                                      SizedBox(width: 15),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            deliveryHeadingText,
                                                            style: TextStyle(
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color:
                                                                    headingcolor),
                                                          ),
                                                          SizedBox(height: 3),
                                                          Text(
                                                            // "ll",
                                                            //data[index]["date"],
                                                            "${todaysDate.day.toString()}/${todaysDate.month.toString()}/${todaysDate.year.toString()}",
                                                            style: TextStyle(
                                                                fontSize: 19,
                                                                letterSpacing:
                                                                    -0.4,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color:
                                                                    circleavatarbgcolor),
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
                                  ))
                              .toList());
                    })
            // for(int i=0;i<data.length;i++){
            //   ListView.builder(
            //     physics: BouncingScrollPhysics(),
            //     itemCount: data.length,
            //     itemBuilder: (context, index) {
            //       print("44 ${data[index]["data"]}");

            //       for (int i = 0; i < data[index]["data"].length; i++) {
            //         var ndata = data[index]["data"][i];
            //         print("-----------------${ndata["name"]}");
            //         print(ndata);
            //         Text(ndata["name"]);

            //       })
            //     },
            ));
  }
}
