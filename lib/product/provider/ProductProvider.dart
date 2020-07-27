import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:gouud/product/model/CommentModel.dart';
import 'package:gouud/product/model/ProductModel.dart';
import 'package:gouud/product/request/ProductRequest.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductProvider with ChangeNotifier {
  final String id;
  String statusCode;
  ProductProvider(this.id);
  Future<ProductModel> productData() async {
    final response = await ProductRequest().records(this.id);
    return ProductModel.fromJson(json.decode(response.body));
  }

  Future<CommentModel> commentsData() async {
    final response = await ProductRequest().comments(this.id);
    return CommentModel.fromJson(json.decode(response.body));
  }

  Future addToCart(String productId, String quantity) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var _token = (prefs.getString('token') ?? '');
    print(_token);
    final response =
        await ProductRequest().addToCart(productId, quantity, _token);
    statusCode = response.statusCode.toString();
  }

  Future setComment(productId, comment, rate) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var _token = (prefs.getString('token') ?? '');
    print(_token);
    final response =
        await ProductRequest().setComment(productId, comment, rate, _token);
    statusCode = response.statusCode.toString();
  }
}
