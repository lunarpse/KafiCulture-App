// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:project_2/customdrawer/drawerScreen.dart';

import '../../../../appbar/appbar_widget.dart';
import '../../../data_fetching/api_service.dart';
import '../../../model/json_model.dart';
import '../../../reusable_widgets/detailsPage_widget.dart';

class PopularDetailsPage extends StatefulWidget {
  const PopularDetailsPage({super.key, required this.popular});

  final popular;

  @override
  State<PopularDetailsPage> createState() => _PopularDetailsPageState();
}

class _PopularDetailsPageState extends State<PopularDetailsPage> {
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
    return Scaffold(
      appBar: AppbarWidget(),
      drawer: DrawerScreen(),
      body: DetailsPageWidget(
        details: widget.popular,
        fetchProducts: offers,
      ),
    );
  }
}
