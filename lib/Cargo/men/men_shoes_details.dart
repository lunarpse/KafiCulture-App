import 'package:flutter/material.dart';
import 'package:project_2/Cargo/reusablewidgets/detailsPage.dart';
import 'package:project_2/appbar/appbar_widget.dart';
import 'package:project_2/customdrawer/drawerScreen.dart';
import 'package:project_2/homepage/data_fetching/api_service.dart';
import 'package:project_2/homepage/model/json_model.dart';
import 'package:project_2/homepage/model/shoe_model.dart';

class MenShoesDetailPage extends StatefulWidget {
  const MenShoesDetailPage({super.key, required this.detail});
  final detail;

  @override
  State<MenShoesDetailPage> createState() => _MenShoesDetailPageState();
}

class _MenShoesDetailPageState extends State<MenShoesDetailPage> {
  List<ShoesJsonModel> drinks = [];

  @override
  void initState() {
    super.initState();
    print(widget.detail.name);
    fetchDrinks();
  }

  Future<void> fetchDrinks() async {
    print("fetchShoe Called");
    drinks = await ApiService.fetchMenShoesData();
    setState(() {});
    print("fetchShoe Completed");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(),
      drawer: DrawerScreen(),
      body: CargoDetailsPageWidget(
        details: widget.detail,
        fetchProducts: drinks,
        nextPage: '/shoedetails',
      ),
    );
  }
}
