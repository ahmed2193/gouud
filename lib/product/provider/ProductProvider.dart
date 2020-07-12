import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:gouud/product/model/ProductModel.dart';
import 'package:gouud/product/request/ProductRequest.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductProvider with ChangeNotifier {
  final String url;
  String statusCode;
  ProductProvider(this.url);
  Future<ProductModel> productData() async {
    final response = await ProductRequest().records(this.url);
    return ProductModel.fromJson(json.decode(response.body));
  }

  Future addToCart(String productId, String quantity) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var _token = (prefs.getString('token') ?? '');
    print(_token);
    final response =
        await ProductRequest().addToCart(productId, quantity, _token);
    statusCode = response.statusCode.toString();
  }
}
