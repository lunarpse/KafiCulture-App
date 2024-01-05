// ignore_for_file: prefer_const_constructors, avoid_print, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_2/constants/color_constants.dart';
import 'package:project_2/constants/text_constants.dart';
import 'package:project_2/homepage/model/json_model.dart';
import 'package:project_2/customdrawer/drawerScreen.dart';
import 'package:project_2/homepage/pages/handcraft/snacks/bloc/snacks_bloc.dart';
import 'package:project_2/homepage/reusable_widgets/background_container_widget.dart';

import '../../../data_fetching/api_service.dart';
import '../../../../appbar/appbar_widget.dart';

class SnacksPage extends StatefulWidget {
  const SnacksPage({super.key});

  @override
  State<SnacksPage> createState() => _SnacksPageState();
}

class _SnacksPageState extends State<SnacksPage> {
  List<JsonModel> snacks = [];

  @override
  void initState() {
    super.initState();

    fetchSnacks();
  }

  Future<void> fetchSnacks() async {
    print("fetchSnacks Called");
    snacks = await ApiService.fetchSnacksData();
    setState(() {});
    print("fetchSnacks Completed");
  }

  @override
  Widget build(BuildContext context) {
    final SnacksBloc snacksBloc = SnacksBloc();
    return BlocConsumer<SnacksBloc, SnacksState>(
      bloc: snacksBloc,
      listenWhen: (previous, current) => current is SnacksActionState,
      buildWhen: (previous, current) => current is! SnacksActionState,
      listener: (context, state) {
        if (state is SnacksToDetailPageActionState) {
          Navigator.pushNamed(context, '/snacksdetails',
              arguments: state.snack);
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
              // shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemCount: snacks.length,
              itemBuilder: (context, index) {
                var snack = snacks[index];
                final name = snack.name;
                final image = snack.image;
                final totalRating = snack.totalRatings;
                final rating = double.parse(snack.rating);
                // final price = snack.price;
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
                              // Navigator.pushNamed(context, '/snacksdetails',
                              //     arguments: snack)
                              snacksBloc.add(
                                  SnacksContainerClickedEvent(snack: snack)),
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 170,
                                  width: 180,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.horizontal(
                                        left: Radius.circular(10)),
                                    child: Hero(
                                      tag: snack,
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
