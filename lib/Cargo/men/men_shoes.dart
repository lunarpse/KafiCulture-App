import 'package:flutter/material.dart';
import 'package:project_2/appbar/appbar_widget.dart';
import 'package:project_2/customdrawer/drawerScreen.dart';
import 'package:project_2/homepage/data_fetching/api_service.dart';
import 'package:project_2/homepage/model/shoe_model.dart';
import 'package:project_2/homepage/reusable_widgets/background_container_widget.dart';

import '../../constants/color_constants.dart';

class MenShoe extends StatefulWidget {
  const MenShoe({super.key});

  @override
  State<MenShoe> createState() => _MenShoeState();
}

class _MenShoeState extends State<MenShoe> {
  List<ShoesJsonModel> shoes = [];

  @override
  void initState() {
    super.initState();
    fetchMenShoe();
  }

  Future<void> fetchMenShoe() async {
    print("fetchShoes Called");
    shoes = await ApiService.fetchMenShoesData();
    setState(() {});
    print("fetchShoes Completed");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarWidget(),
      drawer: const DrawerScreen(),
      body: BackgroundContainerWidget(
        opacity: 1.0,
        x: 3.0,
        y: 3.0,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: shoes.length,
          itemBuilder: (context, index) {
            var shoe = shoes[index];
            final name = shoe.name;
            final brand = shoe.brand;
            final image = shoe.image;
            final description = shoe.description;
            final totalRating = shoe.totalRatings;
            final rating = shoe.rating;
            final price = shoe.price;
            final discount = shoe.discount;
            final offerPrice = shoe.offerPrice;
            double foodRating = double.parse(totalRating);
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Container(
                      width: 380,
                      height: 170,
                      decoration: BoxDecoration(
                          color: containerDecorationColor,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                              color: containerShadowColor,
                              spreadRadius: 3,
                              blurRadius: 10,
                              offset: Offset(0, 3),
                            )
                          ]),
                      child: InkWell(
                        onTap: () => Navigator.pushNamed(context, '/menDetails',
                            arguments: shoe),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 170,
                              width: 180,
                              child: ClipRRect(
                                borderRadius: const BorderRadius.horizontal(
                                    left: Radius.circular(10)),
                                child: Hero(
                                  tag: shoe,
                                  child: Image.asset(
                                    "assets/images/MenShoes/$image.png",
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
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
                                    brand,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: brandTextColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    name,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 16.5,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "\$ $price  ",
                                        style: const TextStyle(
                                          decoration:
                                              TextDecoration.lineThrough,
                                          color: priceColor,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "\$ $offerPrice ",
                                        style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "($discount%)",
                                        style: TextStyle(
                                          color: discountColor,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    description,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Row(
                                        children: List.generate(5, (index) {
                                          return Icon(
                                            index < foodRating.toInt()
                                                ? Icons.star
                                                : Icons.star_border,
                                            color: iconColor,
                                            size: 15,
                                          );
                                        }),
                                      ),
                                      Text(
                                        "($totalRating Ratings)",
                                        style: const TextStyle(
                                            fontSize: 13.5,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    rating,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: ratingColor,
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
