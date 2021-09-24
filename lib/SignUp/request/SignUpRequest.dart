import 'dart:convert';

import 'package:http/http.dart' as http;

class SignUpRequest {
  // static final Map<String , String> _headers =  {'Content-Type':'application/json; charset=utf-8'};

  // Future<http.Response> register(
  //     fullname, email, mobile, password, confirmPassword , countryID) {
  //   return http.post("http://gouud.com/api/ar/login/register", headers: _headers,
  //   body: {
  //     'FullName': "$fullname",
  //     'Email': "$email",
  //     'Mobile': "$mobile",
  //     'Password': "$password",
  //     'ConfirmPasssword': "$confirmPassword",
  //     'CountryID' : '$countryID',
  //   });}


    Future<http.Response> register (String fullname,String email, String mobile, String password, String confirmPassword , var countryID) async {
  var url ='http://gouud.com/api/ar/login/register';

  Map data = {
    'FullName': "$fullname",
      'Email': "$email",
      'Mobile': "$mobile",
      'Password': "$password",
      'ConfirmPasssword': "$confirmPassword",
      'CountryID' : '$countryID',
  };
  //encode Map to JSON
  var body = json.encode(data);

  var response = await http.post(url,
      headers: {"Content-Type": "application/json"},
      body: body
  );
  print("  error ${response.statusCode}");
  print(" body ${response.body}");
  return response;
}





  
}