import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:gouud/bestSeller/model/AllBestSellerModel.dart';
import 'package:gouud/bestSeller/request/AllBestSellerRequest.dart';

class AllBestSellerProvider with ChangeNotifier {
  Future<AllBestSellerModel> allbestSellerData() async {
    final response = await AllBestSellerRequest().records();
    // return SectionsModel.fromJson(json.decode(response.body));
    return AllBestSellerModel.fromJson(json.decode(response.body));
  }
}
