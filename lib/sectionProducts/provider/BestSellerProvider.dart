import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:gouud/sectionProducts/model/BestSellerModel.dart';
import 'package:gouud/sectionProducts/request/BestSellerRequest.dart';

class BestSellerProvider with ChangeNotifier {
  Future<List<BestSellerModel>> bestSellerData() async {
    final response = await BestSellerRequest().records();
    // return SectionsModel.fromJson(json.decode(response.body));
    return (json.decode(response.body) as List)
        .map((i) => BestSellerModel.fromJson(i))
        .toList();
  }
}
