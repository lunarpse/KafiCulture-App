// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:project_2/customdrawer/drawerScreen.dart';

import '../../../../appbar/appbar_widget.dart';
import '../../../data_fetching/api_service.dart';
import '../../../model/json_model.dart';
import '../../../reusable_widgets/detailsPage_widget.dart';

class OfferingsDetailsPage extends StatefulWidget {
  const OfferingsDetailsPage({super.key, required this.offer});

  final offer;

  @override
  State<OfferingsDetailsPage> createState() => _OfferingsDetailsPageState();
}

class _OfferingsDetailsPageState extends State<OfferingsDetailsPage> {
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
    return Scaffold(
      appBar: AppbarWidget(),
      drawer: DrawerScreen(),
      body: DetailsPageWidget(
        details: widget.offer,
        fetchProducts: populars,
        nextPage: '/popularspage',
      ),
    );
  }
}
