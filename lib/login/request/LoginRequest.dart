import 'package:http/http.dart' as http;

class LoginRequest {
  Future<http.Response> getToken(email, password) {
    return http.post("http://brideselection.com/gouud/api/login", body: {
      'grant_type': "password",
      'email': "$email",
      'password': "$password",
    });
  }
}
