// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project_2/Cargo/men/widget/men_details_widget.dart';
import 'package:project_2/appbar/appbar_widget.dart';
import 'package:project_2/customdrawer/drawerScreen.dart';
import 'package:project_2/homepage/data_fetching/api_service.dart';

import '../../homepage/model/ladiesbag_model.dart';

class MenShoeDetailPage extends StatefulWidget {
  const MenShoeDetailPage({super.key, required this.detail});
  final detail;

  @override
  State<MenShoeDetailPage> createState() => _MenShoeDetailPageState();
}

class _MenShoeDetailPageState extends State<MenShoeDetailPage> {
  List<LadiesBagJsonModel> ladiesBag = [];

  @override
  void initState() {
    super.initState();
    fetchLadiesBag();
  }

  Future<void> fetchLadiesBag() async {
    print("fetchLadiesbag Called");
    ladiesBag = await ApiService.fetchLadiesBagData();
    setState(() {});
    print("fetchLadiesbag Completed");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(),
      drawer: DrawerScreen(),
      body: CargoDetailsPageWidget(
        details: widget.detail,
        fetchProducts: ladiesBag,
        nextPage: '/ladiesDetails',
      ),
    );
  }
}
