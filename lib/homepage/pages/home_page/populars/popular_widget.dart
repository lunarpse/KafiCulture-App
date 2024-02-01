// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_2/constants/text_constants.dart';
import 'package:project_2/homepage/bloc/home_bloc.dart';
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
    final HomeBloc homeBloc = HomeBloc();
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateToPopularPageActionState) {
          Navigator.pushNamed(context, '/popularspage',
              arguments: state.popular);
        }
      },
      builder: (context, state) {
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
            final price = popular.price;

            return Card(
              // elevation: 12,
              // shadowColor: Colors.grey,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              color: Colors.transparent,
              // color: Color.fromRGBO(16, 16, 16, 1),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    // boxShadow: [BoxShadow()],
                    gradient: LinearGradient(colors: [
                      Color.fromARGB(255, 0, 0, 0),
                      Color.fromARGB(255, 21, 21, 22),
                      Color(0xFF4D4F52)
                    ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
                child: InkWell(
                  onTap: () => {
                    // Navigator.pushNamed(context, '/popularspage', arguments: popular)
                    homeBloc.add(HomePopularsNavigateEvent(popular))
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Hero(
                            tag: popular,
                            child: Image.asset(
                              'assets/images/$image.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        )),
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                name,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: name_fontSize,
                                  // fontWeight: FontWeight.w500,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 3),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: List.generate(5, (index) {
                                        return Icon(
                                          index < rating
                                              ? Icons.star
                                              : Icons.star_border_purple500,
                                          color: Colors.amber,
                                          size: 15,
                                        );
                                      }),
                                    ),
                                    Text(
                                      "($totalRating Ratings)",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: totalRating_fontSize,
                                        // fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 3),
                              Text(
                                "\$ $price",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: rating_fontSize,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
