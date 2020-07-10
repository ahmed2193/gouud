import 'package:flutter/cupertino.dart';
import 'package:gouud/SignUp/request/SignUpRequest.dart';
import 'package:gouud/SignUp/request/TokenRequest.dart';

class SignUpProvider with ChangeNotifier {
  String code;
  Future register() async {
    final response = await SignUpRequest().register();
    // return SectionsModel.fromJson(json.decode(response.body));
    this.code = response.statusCode.toString();
  }

  Future getToken() async {
    final response = await TokenRequest().getToken();
    return response;
  }
}
