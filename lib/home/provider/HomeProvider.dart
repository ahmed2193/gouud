import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:gouud/home/model/HomeModel.dart';
import 'package:gouud/home/model/adverisementModel.dart';
import 'package:gouud/home/request/HomeRequest.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeProvider with ChangeNotifier {
  String statusCode;
  List<String> cartIds;
  List<String> cartIdsQuantity;
  List<String> favouriteIds;
  Future<HomeModel> homeData() async {
    final response = await HomeRequest().records();
    // return SectionsModel.fromJson(json.decode(response.body));
    return HomeModel.fromJson(json.decode(response.body));
  }

  Future<AdverisementModel> advertisement() async {
    final response = await HomeRequest().advertisement();
    // return SectionsModel.fromJson(json.decode(response.body));
    return AdverisementModel.fromJson(json.decode(response.body));
  }

  cart(productId, quantity) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var _token = (prefs.getString('token') ?? '');
    final response = await HomeRequest().addToCart(productId, quantity, _token);
    this.statusCode = response.statusCode.toString();
    List<String> cartList = (prefs.getStringList('cart') ?? []);
    List<String> quantityList = (prefs.getStringList('quantity') ?? []);
    cartList.add(productId.toString());
    quantityList.add(quantity.toString());
    this.saveCartList(cartList);
    this.saveQuantityList(quantityList);
  }

  favourite(productId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var _token = (prefs.getString('token') ?? '');
    final response = await HomeRequest().addTofavourite(productId, _token);
    this.statusCode = response.statusCode.toString();
    List<String> favouriteList = (prefs.getStringList('favourite') ?? []);
    favouriteList.add(productId.toString());
    this.saveFavouriteList(favouriteList);
  }

  Future<bool> saveCartList(list) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setStringList("cart", list);
  }

  Future<bool> saveFavouriteList(list) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setStringList("favourite", list);
  }

  Future<bool> saveQuantityList(list) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setStringList("quantity", list);
  }

  Future getDataList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    favouriteIds = (prefs.getStringList("favourite") ?? []);
    cartIdsQuantity = (prefs.getStringList("quantity") ?? []);
    cartIds = (prefs.getStringList("cart") ?? []);
  }
}
