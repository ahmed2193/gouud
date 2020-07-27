import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:gouud/SignUp/model/CountryModel.dart';
import 'package:gouud/SignUp/model/SignUpModel.dart';
import 'package:gouud/SignUp/request/CountryRequest.dart';
import 'package:gouud/SignUp/request/SignUpRequest.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpProvider with ChangeNotifier {
  String code;
  String tokenCode;
  SignUpModel data;
  Future register(name, email, phone, password, cpassword, countryId) async {
    final response = await SignUpRequest()
        .register(name, email, phone, password, cpassword, countryId);
    this.code = response.statusCode.toString();
    print(response.body.toString());
    if (this.code == '201') {
      data = SignUpModel.fromJson(json.decode(response.body));
      print(data);
      _saveToken(data.data.token);
      _saveEntered();
    }
  }

  Future<CountryModel> countriesData() async {
    final response = await CountryRequest().records();
    return CountryModel.fromJson(json.decode(response.body));
  }

  _saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    var value = token;
    prefs.setString(key, value);
  }

  _saveEntered() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'Inner';
    var value = true;
    prefs.setBool(key, value);
  }
}
