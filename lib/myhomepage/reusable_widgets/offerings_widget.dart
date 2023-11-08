// ignore_for_file: prefer_const_constructors, avoid_print, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project_2/myhomepage/model/json_model.dart';
import 'package:project_2/myhomepage/constant_homepage/constant_offers.dart';

import '../pages/home_page/latest_offerings/offerings_details_page.dart';
import '../data_fetching/api_service.dart';

class OfferingsWidget extends StatefulWidget {
  const OfferingsWidget({super.key});

  @override
  State<OfferingsWidget> createState() => _OfferingsState();
}

class _OfferingsState extends State<OfferingsWidget> {
  List<JsonModel> offers = [];

  @override
  void initState() {
    super.initState();

    fetchOffers();
  }

  Future<void> fetchOffers() async {
    print("fetchOffers Called");
    offers = await ApiService.fetchOffersData();
    setState(() {});
    print("fetchOffers Completed");
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: containerheight,
      width: MediaQuery.of(context).size.width,
      child: PageView.builder(
        itemCount: offers.length,
        // padEnds: false,
        // pageSnapping: false,
        physics: BouncingScrollPhysics(),
        controller: PageController(
          viewportFraction: pageController_viewportFraction,
          initialPage: pageController_initialPage,
        ),
        itemBuilder: (context, index) {
          var offer = offers[index];
          final name = offer.name;
          final image = offer.image;
          final totalRating = offer.totalRatings;
          final rating = offer.rating;
          double foodRating = double.parse(totalRating);
          return Stack(
            children: [
              Container(
                margin: EdgeInsets.all(margin_edge),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(margin_borderRadius),
                    boxShadow: [
                      BoxShadow(
                        color: margin_boxShadow_color,
                        offset: Offset(margin_boxShadow_offSet_startPoint,
                            margin_boxShadow_offSet_endPoint),
                        blurRadius: margin_boxShadow_blurRadius,
                        spreadRadius: margin_boxShadow_spreadRadius,
                      ),
                    ]),
                child: Hero(
                  tag: offer,
                  child: Image.asset(
                    "assets/images/$image.jpg",
                    height: image_height,
                    width: image_width,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              InkWell(
                onTap: () => Navigator.pushNamed(context, '/offerspage',
                    arguments: offer),
              ),
              Padding(
                padding: const EdgeInsets.all(column_padding_edge),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(name,
                            style: TextStyle(
                                color: name_color,
                                fontSize: name_fontSize,
                                fontWeight: FontWeight.bold)),
                        // Text(
                        //   "",
                        //   style: TextStyle(
                        //       fontSize: 16,
                        //       fontWeight: FontWeight.bold,
                        //       color: Colors.blueGrey.shade800),
                        // ),
                      ],
                    ),
                    Row(
                      children: [
                        Row(
                          children: List.generate(5, (index) {
                            return Icon(
                              index < foodRating.toInt()
                                  ? Icons.star
                                  : Icons.star_border,
                              color: Colors.amber,
                              size: 17,
                            );
                          }),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: totalRating_padding_horizondal),
                          child: Text(
                            "($totalRating Ratings)",
                            style: TextStyle(
                                fontSize: totalRating_fontSize,
                                fontWeight: FontWeight.bold,
                                color: totalRating_Color),
                          ),
                        )
                      ],
                    ),
                    Text(
                      rating,
                      style: TextStyle(
                        fontSize: rating_fontSize,
                        fontWeight: FontWeight.bold,
                        color: rating_color,
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
