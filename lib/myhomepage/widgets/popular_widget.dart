// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:project_2/myhomepage/model/json_model.dart';
import 'package:project_2/values/homepage/populars.dart';
import '../pages/popular_details_page.dart';
import '../service/api_service.dart';

class PopularWidget extends StatefulWidget {
  const PopularWidget({super.key});

  @override
  State<PopularWidget> createState() => _PopularState();
}

class _PopularState extends State<PopularWidget> {
  List<JsonModel> populars = [];

  @override
  void initState() {
    super.initState();

    fetchPopularData();
  }

  Future<void> fetchPopularData() async {
    print("fetchPopular Called");
    populars = await ApiService.fetchPopularData();
    setState(() {});
    print("fetchPopular Completed");
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: populars.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: gridView_crossAxisCount,
        crossAxisSpacing: gridView_crossAxisSpacing,
        mainAxisSpacing: gridView_mainAxisSpacing,
        // childAspectRatio: 1.6 / 2,
        mainAxisExtent: gridView_mainAxisExtent,
      ),
      itemBuilder: (context, index) {
        var popular = populars[index];
        final image = popular.image;
        final name = popular.name;
        final totalRating = popular.totalRatings;
        final rating = popular.rating;
        double foodRating = double.parse(totalRating);
        return Card(
          child: InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        PopularDetailsPage(popular: popular))),
            child: Container(
              decoration: BoxDecoration(
                color: card_container_boxDecoration_color,
                boxShadow: const [
                  BoxShadow(
                    color: card_container_boxShadow_color,
                    offset: Offset(card_container_boxShadow_offSet_startPoint,
                        card_container_boxShadow_offSet_endPoint),
                    blurRadius: card_container_boxShadow_blurRadius,
                    spreadRadius: card_container_boxShadow_spreadRadius,
                  ),
                ],
                borderRadius: BorderRadius.circular(
                    card_container_boxShadow_borderRadius),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: ClipRRect(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(10)),
                    child: Hero(
                      tag: popular,
                      child: Image.asset(
                        'assets/images/$image.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  )),
                  // Expanded(
                  //   child: ClipRRect(
                  //     borderRadius: BorderRadius.vertical(
                  //       top: Radius.circular(10),
                  //     ),
                  //     child: Material(
                  //       child: Hero(
                  //         tag: popular,
                  //         child: Ink.image(
                  //           image: AssetImage(
                  //             'assets/images/$image.jpg',
                  //           ),
                  //           fit: BoxFit.cover,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              name,
                              style: TextStyle(
                                fontSize: name_fontSize,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            // Text("(${coffee.category})"),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            Text(
                              "($totalRating Ratings)",
                              style: TextStyle(
                                  fontSize: totalRating_fontSize,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Text(
                          rating,
                          style: TextStyle(
                              fontSize: rating_fontSize,
                              fontWeight: FontWeight.w500),
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
    );
  }
}
