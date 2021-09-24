import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:gouud/login/model/LoginModel.dart';
import 'package:gouud/login/request/LoginRequest.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginProvider with ChangeNotifier {
  String code;
  String tokenCode;
  LoginModel data;
  Future getToken(email, password) async {
    final response = await LoginRequest().getToken(email, password);
    code = response.statusCode.toString();
    print(" code::::: ${code}");     
     print(" body::::: ${response.body.toString()}");

    if (code == '200' ) {
      data = LoginModel.fromJson(json.decode(response.body));
      _saveToken(data.accessToken);
      _saveEntered();
       print(" body sucsse?? ${response.body}");
    }
  }

  _saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    // bearer
    var value = token;
    print(token);
    prefs.setString(key, value);
  }

  _saveEntered() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'Inner';
    var value = true;
    prefs.setBool(key, value);
  }
}
