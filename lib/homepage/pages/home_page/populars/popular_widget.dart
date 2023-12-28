// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:project_2/homepage/model/json_model.dart';
import 'package:project_2/homepage/constant_homepage/constant_populars.dart';
import '../../../data_fetching/api_service.dart';

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
        final rating = double.parse(popular.rating);

        return Card(
          elevation: 20,
          shadowColor: Colors.grey,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: InkWell(
            onTap: () => Navigator.pushNamed(context, '/popularspage',
                arguments: popular),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                  child: Hero(
                    tag: popular,
                    child: Image.asset(
                      'assets/images/$image.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                )),
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
                                index < rating
                                    ? Icons.star
                                    : Icons.star_border_purple500,
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
                        "$rating",
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
        );
      },
    );
  }
}
