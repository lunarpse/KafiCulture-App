// ignore_for_file: avoid_print
import 'dart:convert';
import 'package:flutter/services.dart';

import '../model/json_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static fetchOffersData() async {
    // var url = Uri.parse("http://10.0.2.2:3000/offers");
    // var res = await http.get(url);
    // if (res.statusCode == 200) {
    //   final jsonData = json.decode(res.body) as List<dynamic>;
    //   // print(jsonData);
    //   return jsonData.map((e) => JsonModel.fromJson(e)).toList();
    // } else {
    //   print('Failed to load Offers data');
    // }

    final String data = await rootBundle.loadString('assets/json/offers.json');
    final List<dynamic> jsonData = json.decode(data);
    return jsonData.map((e) => JsonModel.fromJson(e)).toList();
  }

  static fetchPopularData() async {
    // var url = Uri.parse("http://10.0.2.2:3000/popular");
    // var res = await http.get(url);
    // if (res.statusCode == 200) {
    //   final jsonData = json.decode(res.body) as List<dynamic>;
    //   // print(jsonData);
    //   return jsonData.map((e) => JsonModel.fromJson(e)).toList();
    // } else {
    //   print('Failed to load Popular data');
    // }

    final String data = await rootBundle.loadString('assets/json/popular.json');
    final List<dynamic> jsonData = json.decode(data);
    return jsonData.map((e) => JsonModel.fromJson(e)).toList();
  }

  static fetchCoffeeData() async {
    // var url = Uri.parse("http://10.0.2.2:3000/coffee");
    // var res = await http.get(url);
    // if (res.statusCode == 200) {
    //   final jsonData = json.decode(res.body) as List<dynamic>;
    //   // print(jsonData);
    //   return jsonData.map((e) => JsonModel.fromJson(e)).toList();
    // } else {
    //   print('Failed to load coffee data');
    // }

    final String data = await rootBundle.loadString('assets/json/coffee.json');
    final List<dynamic> jsonData = json.decode(data);
    return jsonData.map((e) => JsonModel.fromJson(e)).toList();
  }

  static fetchSnacksData() async {
    // var url = Uri.parse("http://10.0.2.2:3000/snacks");
    // var res = await http.get(url);
    // if (res.statusCode == 200) {
    //   final jsonData = json.decode(res.body) as List<dynamic>;
    //   // print(jsonData);
    //   return jsonData.map((e) => JsonModel.fromJson(e)).toList();
    // } else {
    //   print('Failed to load snacks data');
    // }

    final String data = await rootBundle.loadString('assets/json/snacks.json');
    final List<dynamic> jsonData = json.decode(data);
    return jsonData.map((e) => JsonModel.fromJson(e)).toList();
  }

  static fetchCookiesData() async {
    // var url = Uri.parse("http://10.0.2.2:3000/cookies");
    // var res = await http.get(url);
    // if (res.statusCode == 200) {
    //   final jsonData = json.decode(res.body) as List<dynamic>;
    //   // print(jsonData);
    //   return jsonData.map((e) => JsonModel.fromJson(e)).toList();
    // } else {
    //   print('Failed to load cookies data');
    // }

    final String data = await rootBundle.loadString('assets/json/cookies.json');
    final List<dynamic> jsonData = json.decode(data);
    return jsonData.map((e) => JsonModel.fromJson(e)).toList();
  }
}
