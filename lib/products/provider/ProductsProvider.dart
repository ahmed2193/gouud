import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:gouud/products/model/ProductsModel.dart';
import 'package:gouud/products/request/ProductsRequest.dart';

class ProductsProvider with ChangeNotifier {
  final String url;
  ProductsProvider(this.url);
  Future<ProductsModel> productsData(int page) async {
    // page = page - 1;
    final response = await ProductsRequest()
        .records(this.url + '&pageNo=' + page.toString() + '&pageSize=10');
    return ProductsModel.fromJson(json.decode(response.body));
  }

  List<dynamic> listItemsGetterPages(ProductsModel pagesData) {
    List<ProductsCards> list = [];
    pagesData.productsCards.forEach((value) {
      list.add(value);
    });
    return list;
  }

  int totalPagesGetter(ProductsModel productsData) {
    return productsData.totalNumberOfProducts;
  }

  bool pageErrorChecker(ProductsModel productsData) {
    //return countriesData.statusCode != 200;
    return false;
  }
}
