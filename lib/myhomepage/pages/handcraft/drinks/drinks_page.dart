// ignore_for_file: prefer_const_constructors, avoid_print, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project_2/myhomepage/model/json_model.dart';
import 'package:project_2/appbar/appbar_widget.dart';
// import 'package:project_2/myhomepage/widgets/categories_page_widget.dart';
// import 'package:project_2/myhomepage/widgets/categories_widget.dart';

import '../../../data_fetching/api_service.dart';
import 'drinks_page_details.dart';

class DrinksPage extends StatefulWidget {
  const DrinksPage({super.key});

  @override
  State<DrinksPage> createState() => _DrinksPageState();
}

class _DrinksPageState extends State<DrinksPage> {
  List<JsonModel> drinks = [];

  @override
  void initState() {
    super.initState();

    fetchDrinks();
  }

  Future<void> fetchDrinks() async {
    print("fetchDrinks Called");
    drinks = await ApiService.fetchCoffeeData();
    setState(() {});
    print("fetchDrinks Completed");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/11.jpeg'), fit: BoxFit.fill),
        ),
        child: ListView.builder(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          itemCount: drinks.length,
          itemBuilder: (context, index) {
            var drink = drinks[index];
            final name = drink.name;
            final image = drink.image;
            // final description = drink.description;
            final totalRating = drink.totalRatings;
            final rating = drink.rating;
            // final price = drink.price;
            double foodRating = double.parse(totalRating);
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
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              spreadRadius: 3,
                              blurRadius: 10,
                              offset: Offset(0, 3),
                            )
                          ]),
                      child: InkWell(
                        onTap: () => Navigator.pushNamed(
                            context, '/drinksdetails',
                            arguments: drink),
                        child: Row(
                          children: [
                            Container(
                              height: 170,
                              width: 180,
                              child: ClipRRect(
                                borderRadius: BorderRadius.horizontal(
                                    left: Radius.circular(10)),
                                child: Hero(
                                  tag: drink,
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
                                    "Discover the artistry of flavors, where every sip is a celebration of perfection.",
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
                                            index < foodRating.toInt()
                                                ? Icons.star
                                                : Icons.star_border,
                                            color: Colors.amber,
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
                                    rating,
                                    style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.red,
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
