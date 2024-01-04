// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project_2/homepage/bloc/home_bloc.dart';
import 'package:project_2/homepage/pages/home_page/home_headings.dart';
import 'package:project_2/homepage/constant_homepage/constant_categories.dart';
import 'package:project_2/homepage/constant_homepage/constant_offers.dart';
import 'package:project_2/homepage/constant_homepage/constant_populars.dart';
import 'package:project_2/customdrawer/drawerScreen.dart';
import 'package:project_2/homepage/widgets/checking.dart';
import '../../../appbar/appbar_widget.dart';
import '../../reusable_widgets/background_container_widget.dart';
import 'latest_offerings/offerings_widget.dart';
import 'populars/popular_widget.dart';
import '../handcraft/handcraft_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    final HomeBloc homeBloc = HomeBloc();
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is HomeActionState,
      listener: (context, state) => {
        if (state is HomeNavigateToOfferPageActionState)
          {
            
            Navigator.pushNamed(context, '/drinks'),
          }
      },
      builder: (context, state) {
        
        return Scaffold(
          appBar: AppbarWidget(),
          body: BackgroundContainerWidget(
            opacity: 0.7,
            x: 2.0,
            y: 2.0,
            child: ListView(
              padding: EdgeInsets.only(left: 5, right: 5, bottom: 10),
              children: [
                //---------------->Latest Offerings
                Padding(
                  padding: EdgeInsets.only(top: 10, left: 5),
                  child: HomeHeading(
                      headingText: heading1,
                      headingText_fontSize: heading1_fontSize),
                ),

                //---------------->Latest Offerings widget
                OfferingsWidget(),

                //---------------->Categories
                Padding(
                    padding: EdgeInsets.only(top: 10, left: 5),
                    child: HomeHeading(
                        headingText: heading2,
                        headingText_fontSize: heading2_fontSize)),

                //---------------->Categories widget
                HandCraftedWidget(),

                // ---------------------------->Popular
                Padding(
                    padding: EdgeInsets.only(top: 10, left: 5),
                    child: HomeHeading(
                        headingText: heading3,
                        headingText_fontSize: heading3_fontSize)),

                //-------------------------->popular widget
                PopularWidget(),
              ],
            ),
          ),
          drawer: DrawerScreen(),
        );
      },
    );
  }
}
