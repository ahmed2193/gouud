import 'package:http/http.dart' as http;

class TokenRequest {
  Future<http.Response> getToken(email, password) {
    return http.post("http://gouud.com/token", body: {
      'grant_type': "password",
      'userName': "$email",
      'Password': "$password",
    });
  }
}
