// ignore_for_file: prefer_const_constructors, avoid_print, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project_2/constants/color_constants.dart';
import 'package:project_2/constants/text_constants.dart';
import 'package:project_2/customdrawer/drawerScreen.dart';
import 'package:project_2/homepage/reusable_widgets/background_container_widget.dart';

import '../../../model/json_model.dart';
import '../../../data_fetching/api_service.dart';
import '../../../../appbar/appbar_widget.dart';

class CookiesPage extends StatefulWidget {
  const CookiesPage({super.key});

  @override
  State<CookiesPage> createState() => _CookiesPageState();
}

class _CookiesPageState extends State<CookiesPage> {
  List<JsonModel> cookies = [];

  @override
  void initState() {
    super.initState();

    fetchCookies();
  }

  Future<void> fetchCookies() async {
    print("fetchCookies Called");
    cookies = await ApiService.fetchCookiesData();
    setState(() {});
    print("fetchCookies Completed");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(),
      drawer: DrawerScreen(),
      body: BackgroundContainerWidget(
        opacity: 0.7,
        x: 2.0,
        y: 2.0,
        child: ListView.builder(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          itemCount: cookies.length,
          itemBuilder: (context, index) {
            var cookie = cookies[index];
            final name = cookie.name;
            final image = cookie.image;
            final totalRating = cookie.totalRatings;
            final rating = double.parse(cookie.rating);
            // final price = cookie.price;
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Container(
                      width: 380,
                      height: 170,
                      decoration: BoxDecoration(
                          color: cookieboxdeccolor,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: cookieboxshadowcolor,
                              spreadRadius: 2,
                              blurRadius: 4,
                              offset: Offset(0, 2),
                            )
                          ]),
                      child: InkWell(
                        onTap: () => Navigator.pushNamed(
                            context, '/cookiesdetails',
                            arguments: cookie),
                        child: Row(
                          children: [
                            Container(
                              height: 170,
                              width: 180,
                              child: ClipRRect(
                                borderRadius: BorderRadius.horizontal(
                                    left: Radius.circular(10)),
                                child: Hero(
                                  tag: cookie,
                                  child: Image.asset(
                                    "assets/images/$image.jpg",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Container(
                              width: 175,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    name,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    productdescription,
                                    style: TextStyle(
                                      fontSize: 14,
                                      // fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: List.generate(5, (index) {
                                          return Icon(
                                            index < rating
                                                ? Icons.star
                                                : Icons.star_border,
                                            color: cookieiconstarcolor,
                                            size: 18,
                                          );
                                        }),
                                      ),
                                      Text(
                                        "($totalRating Ratings)",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "$rating",
                                    style: TextStyle(
                                      fontSize: 17,
                                      color: cookieratingtextcolor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
