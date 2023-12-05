// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:project_2/customdrawer/drawerScreen.dart';
import '../../../../appbar/appbar_widget.dart';
import '../../../data_fetching/api_service.dart';
import '../../../model/json_model.dart';
import '../../../reusable_widgets/detailsPage_widget.dart';

class CookiesPageDetails extends StatefulWidget {
  const CookiesPageDetails({super.key, required this.detail});

  final detail;

  @override
  State<CookiesPageDetails> createState() => _CookiesPageDetailsState();
}

class _CookiesPageDetailsState extends State<CookiesPageDetails> {
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
      drawer: DrawerScreen(),
      body: DetailsPageWidget(
        details: widget.detail,
        fetchProducts: drinks,
        nextPage: '/drinksdetails',
      ),
    );
  }
}
