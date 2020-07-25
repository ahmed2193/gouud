import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:gouud/products/model/ProductsModel.dart';
import 'package:gouud/products/request/ProductsRequest.dart';

class ProductsProvider with ChangeNotifier {
  final String id;
  ProductsProvider(this.id);
  Future<ProductsModel> productsData(int page) async {
    final response = await ProductsRequest().records(this.id, page);
    return ProductsModel.fromJson(json.decode(response.body));
  }

  List<dynamic> listItemsGetterPages(ProductsModel pagesData) {
    List<Data> list = [];
    pagesData.data.forEach((value) {
      list.add(value);
    });
    return list;
  }

  int totalPagesGetter(ProductsModel productsData) {
    return productsData.count;
  }

  bool pageErrorChecker(ProductsModel productsData) {
    //return countriesData.statusCode != 200;
    return false;
  }
}
