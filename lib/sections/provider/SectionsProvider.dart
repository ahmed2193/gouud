import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:gouud/sections/model/SectionsModel.dart';
import 'package:gouud/sections/request/SectionRequest.dart';

class SectionsProvider with ChangeNotifier {
  SectionsModel sections;
  String errorMessage;
  bool loading = false;
  void setLoading(value) {
    loading = value;
    notifyListeners();
  }

  bool isLoading() {
    return loading;
  }

  void setSections(value) {
    sections = value;
    notifyListeners();
  }

  SectionsModel getSections() {
    return sections;
  }

  void setMessage(value) {
    errorMessage = value;
    notifyListeners();
  }

  String getMessage() {
    return errorMessage;
  }

  Future<bool> fetchSections() async {
    await SectionRequest().records().then((data) {
      if (data.statusCode == 201) {
        setSections(SectionsModel.fromJson(json.decode(data.body)));
      } else {
        Map<String, dynamic> result = json.decode(data.body);
        setMessage(result['message']);
      }
    });

    return isSections();
  }

  bool isSections() {
    return sections != null ? true : false;
  }

  Future<SectionsModel> sectionsData() async {
    final response = await SectionRequest().records();
    // return SectionsModel.fromJson(json.decode(response.body));
    return SectionsModel.fromJson(json.decode(response.body));
  }
}
