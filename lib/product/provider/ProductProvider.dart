import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:gouud/product/model/ProductModel.dart';
import 'package:gouud/product/request/ProductRequest.dart';

class ProductProvider with ChangeNotifier {
  final String url;
  ProductProvider(this.url);
  Future<ProductModel> productData() async {
    final response = await ProductRequest().records(this.url);
    return ProductModel.fromJson(json.decode(response.body));
  }
}
