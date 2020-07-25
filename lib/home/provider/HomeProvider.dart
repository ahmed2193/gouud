import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:gouud/home/model/HomeModel.dart';
import 'package:gouud/home/request/HomeRequest.dart';

class HomeProvider with ChangeNotifier {
  Future<HomeModel> homeData() async {
    final response = await HomeRequest().records();
    // return SectionsModel.fromJson(json.decode(response.body));
    return HomeModel.fromJson(json.decode(response.body));
  }
}
