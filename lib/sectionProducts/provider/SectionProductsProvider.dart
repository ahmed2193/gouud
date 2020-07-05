import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:gouud/sectionProducts/model/SectionProductsModel.dart';
import 'package:gouud/sectionProducts/request/SectionProductsRequest.dart';

class SectionProductsProvider with ChangeNotifier {
  Future<List<SectionProductsModel>> sectionProductsData(url) async {
    final response = await SectionProductsRequest().records(url);
    return (json.decode(response.body) as List)
        .map((i) => SectionProductsModel.fromJson(i))
        .toList();
  }
}
