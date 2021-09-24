import 'package:http/http.dart' as http;

class LoginRequest {
  Map<String,String> _header={
"Content-Type":"application/x-www-form-urlencoded; charset=UTF-8",
};
  Future<http.Response> getToken(email, password) {
    return http.post("http://gouud.com/token", headers:_header ,body: {
      'grant_type': "password",
      'username': "$email",
      'password': "$password",
    });
  }
}
