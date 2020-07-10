import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:gouud/SignUp/model/SignUpModel.dart';
import 'package:gouud/SignUp/request/SignUpRequest.dart';
import 'package:gouud/SignUp/request/TokenRequest.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpProvider with ChangeNotifier {
  String code;
  String tokenCode;
  SignUpModel data;
  Future register(name, email, mobile, password, confirmPassword) async {
    final response = await SignUpRequest()
        .register(name, email, mobile, password, confirmPassword);
    this.code = response.statusCode.toString();
    // print(this.code);
  }

  Future getToken(email, password) async {
    final response = await TokenRequest().getToken(email, password);
    tokenCode = response.statusCode.toString();
    if (tokenCode == '200') {
      data = SignUpModel.fromJson(json.decode(response.body));
      _saveToken(data.accessToken);
    }
  }

  _saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    var value = token;
    prefs.setString(key, value);
  }
}
