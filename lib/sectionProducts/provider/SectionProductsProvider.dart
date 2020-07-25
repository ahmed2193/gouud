import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:gouud/sectionProducts/model/SectionProductsModel.dart';
import 'package:gouud/sectionProducts/request/SectionProductsRequest.dart';

class SectionProductsProvider with ChangeNotifier {
  Future<SectionProductsModel> sectionProductsData(departmentId) async {
    final response = await SectionProductsRequest().records(departmentId);
    return SectionProductsModel.fromJson(json.decode(response.body));
  }
}
