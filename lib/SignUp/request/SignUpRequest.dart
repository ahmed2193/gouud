import 'package:http/http.dart' as http;

class SignUpRequest {
  Future<http.Response> register() {
    return http.get("http://gouud.com/api/ar/Login/Register");
  }
}
