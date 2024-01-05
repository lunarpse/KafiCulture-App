// ignore_for_file: prefer_const_constructors, avoid_print, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_2/constants/color_constants.dart';
import 'package:project_2/constants/text_constants.dart';
import 'package:project_2/homepage/model/json_model.dart';
import 'package:project_2/appbar/appbar_widget.dart';
import 'package:project_2/customdrawer/drawerScreen.dart';
import 'package:project_2/homepage/pages/handcraft/drinks/bloc/drinks_bloc.dart';
import 'package:project_2/homepage/reusable_widgets/background_container_widget.dart';
import '../../../data_fetching/api_service.dart';

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
    final DrinksBloc drinksBloc = DrinksBloc();
    return BlocConsumer<DrinksBloc, DrinksState>(
      bloc: drinksBloc,
      listenWhen: (previous, current) => current is DrinksActionState,
      buildWhen: (previous, current) => current is! DrinksActionState,
      listener: (context, state) {
        if (state is DrinksToDetailPageActionState) {
          Navigator.pushNamed(context, '/drinksdetails',
              arguments: state.drink);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppbarWidget(),
          drawer: DrawerScreen(),
          body: BackgroundContainerWidget(
            opacity: 1.0,
            x: 3.0,
            y: 3.0,
            child: ListView.builder(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemCount: drinks.length,
              itemBuilder: (context, index) {
                var drink = drinks[index];
                final name = drink.name;
                final image = drink.image;
                final totalRating = drink.totalRatings;
                final rating = double.parse(drink.rating);
                // final price = drink.price;

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
                                  spreadRadius: 3,
                                  blurRadius: 10,
                                  offset: Offset(0, 3),
                                )
                              ]),
                          child: InkWell(
                            onTap: () => {
                              // Navigator.pushNamed(
                              //   context, '/drinksdetails',
                              //   arguments: drink)
                              drinksBloc.add(
                                  DrinksContainerClickedEvent(drink: drink))
                            },
                            child: Row(
                              children: [
                                SizedBox(
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
                                SizedBox(
                                  width: 175,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                        // addons,
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
      },
    );
  }
}
