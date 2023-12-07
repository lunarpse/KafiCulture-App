import 'package:flutter/material.dart';
import 'package:project_2/appbar/appbar_widget.dart';
import 'package:project_2/customdrawer/drawerScreen.dart';
import 'package:project_2/homepage/data_fetching/api_service.dart';
import 'package:project_2/homepage/model/ladiesbag_model.dart';
import 'package:project_2/homepage/reusable_widgets/background_container_widget.dart';

class LadiesBag extends StatefulWidget {
  const LadiesBag({super.key});

  @override
  State<LadiesBag> createState() => _LadiesBagState();
}

class _LadiesBagState extends State<LadiesBag> {
  List<LadiesBagJsonModel> ladiesBag = [];

  @override
  void initState() {
    super.initState();
    fetchLadiesBag();
  }

  Future<void> fetchLadiesBag() async {
    print("fetchLadiesbag Called");
    ladiesBag = await ApiService.fetchLadiesBagData();
    setState(() {});
    print("fetchLadiesbag Completed");
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
          // shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: ladiesBag.length,
          itemBuilder: (context, index) {
            var bag = ladiesBag[index];
            final name = bag.name;
            final brand = bag.brand;
            final image = bag.image;
            final description = bag.description;
            final totalRating = bag.totalRatings;
            final rating = bag.rating;
            final price = bag.price;
            final discount = bag.discount;
            final offerPrice = bag.offerPrice;
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
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              spreadRadius: 3,
                              blurRadius: 10,
                              offset: Offset(0, 3),
                            )
                          ]),
                      child: InkWell(
                        onTap: () => Navigator.pushNamed(
                            context, '/snacksdetails',
                            arguments: bag),
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
                                  tag: bag,
                                  child: Image.asset(
                                    "assets/images/LadiesBag/$image.jpg",
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
                                      color: Colors.black54,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    name,
                                    maxLines: 1,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "\$${price.toString()} ",
                                        style: const TextStyle(
                                          decoration:
                                              TextDecoration.lineThrough,
                                          color: Colors.black54,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "\$${offerPrice.toString()} ",
                                        style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "(${discount}%)",
                                        style: TextStyle(
                                          color: Colors.green[700],
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    description,
                                    maxLines: 2,
                                    style: TextStyle(
                                      fontSize: 14,
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
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    rating,
                                    style: const TextStyle(
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
