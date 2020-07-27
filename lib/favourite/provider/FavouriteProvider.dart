import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:gouud/favourite/model/FavouriteModel.dart';
import 'package:gouud/favourite/request/FavouriteRequest.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavouritesProvider with ChangeNotifier {
  Future<FavouriteModel> productsData(int page) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var _token = (prefs.getString('token') ?? '');
    final response = await FavouriteRequest().records(page, _token);
    return FavouriteModel.fromJson(json.decode(response.body));
  }

  List<dynamic> listItemsGetterPages(FavouriteModel pagesData) {
    List<Data> list = [];
    pagesData.data.forEach((value) {
      list.add(value);
    });
    return list;
  }

  int totalPagesGetter(FavouriteModel productsData) {
    return productsData.count;
  }

  bool pageErrorChecker(FavouriteModel productsData) {
    //return countriesData.statusCode != 200;
    return false;
  }
}
