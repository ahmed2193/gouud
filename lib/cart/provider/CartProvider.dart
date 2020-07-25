import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:gouud/cart/model/CartModel.dart';
import 'package:gouud/cart/request/CartRequest.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartProvider with ChangeNotifier {
  Future<List<CartModel>> cartData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var _token = (prefs.getString('token') ?? '');
    final response = await CartRequest().records(_token);
    return (json.decode(response.body) as List)
        .map((i) => CartModel.fromJson(i))
        .toList();
  }
}
