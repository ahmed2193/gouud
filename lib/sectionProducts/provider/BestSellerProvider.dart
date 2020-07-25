import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:gouud/sectionProducts/model/BestSellerModel.dart';
import 'package:gouud/sectionProducts/request/BestSellerRequest.dart';

class BestSellerProvider with ChangeNotifier {
  Future<BestSellerModel> bestSellerData() async {
    final response = await BestSellerRequest().records();
    // return SectionsModel.fromJson(json.decode(response.body));
    return BestSellerModel.fromJson(json.decode(response.body));
  }
}
