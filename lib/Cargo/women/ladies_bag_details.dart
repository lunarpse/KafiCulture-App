// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:project_2/Cargo/women/ladies_details_widget.dart';
import 'package:project_2/appbar/appbar_widget.dart';
import 'package:project_2/customdrawer/drawerScreen.dart';
import 'package:project_2/homepage/data_fetching/api_service.dart';
import 'package:project_2/homepage/model/shoe_model.dart';
import 'package:project_2/homepage/reusable_widgets/detailsPage_widget.dart';

class LadiesBagDetailsPage extends StatefulWidget {
  const LadiesBagDetailsPage({super.key, required this.detail});

  final detail;

  @override
  State<LadiesBagDetailsPage> createState() => _LadiesBagDetailsPageState();
}

class _LadiesBagDetailsPageState extends State<LadiesBagDetailsPage> {
  List<ShoesJsonModel> mens = [];

  @override
  void initState() {
    super.initState();
    fetchMen();
  }

  Future<void> fetchMen() async {
    print("fetchMen Called");
    mens = await ApiService.fetchMenShoesData();
    setState(() {});
    print("fetchMen Completed");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(),
      drawer: DrawerScreen(),
      body: LadiesDetailsWidget(
        details: widget.detail,
        fetchProducts: mens,
        nextPage: '/ladiesdetails',
      ),
    );
  }
}
