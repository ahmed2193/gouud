import 'package:http/http.dart' as http;

class TokenRequest {
  Future<http.Response> getToken() {
    return http.get("http://gouud.com/api/ar/Login/Register");
  }
}
