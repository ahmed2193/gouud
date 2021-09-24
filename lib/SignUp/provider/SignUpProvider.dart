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
     
     
    print(" print body ::${response.body.toString()}");
    if (this.code == '200') {
      data = SignUpModel.fromJson(json.decode(response.body));
      print(data);
      _saveToken(data.accessToken);
      // _saveEntered();
    }else{ 
      print( " print error code${this.code})");
      }
   
  }

  Future<List<Data>> countriesData() async {
    final response = await CountryRequest().records();

    //  print('object  ${response.body}');

   List<Data> data =[];
   var body =  json.decode(response.body).cast<Map<String, dynamic>>();
   this.code = response.statusCode.toString();
  
    if ( code == '200') {
       data = body.map<Data>((json) {
        return Data.fromJson(json);
      }).toList();
      // print(data);
       return data;

    }
    else {
      throw Exception('Failed to load internet');
    }

  //  for (var item in body){
  //    data.add(Data.fromJson(item));
  //  }
  //   print('object  ${data.length}');

    // return data;
  }

  
    // if (response.statusCode == 200) {
    //   final items = json.decode(response.body).cast<Map<String, dynamic>>();
    //   List<Users> listOfUsers = items.map<Users>((json) {
    //     return Users.fromJson(json);
    //   }).toList();

    //   return listOfUsers;
    // } else {
    //   throw Exception('Failed to load internet');
    // }

  _saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    var value = token;
    prefs.setString(key, value);
  }

  // _saveEntered() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final key = 'Inner';
  //   var value = true;
  //   prefs.setBool(key, value);
  // }
}
