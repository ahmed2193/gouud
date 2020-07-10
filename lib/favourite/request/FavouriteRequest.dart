import 'package:http/http.dart' as http;

class FavouriteRequest {
  Future<http.Response> register() {
    return http.get("http://gouud.com/api/ar/Login/Register");
  }
}
