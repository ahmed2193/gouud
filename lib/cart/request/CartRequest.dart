import 'package:http/http.dart' as http;

class CartRequest {
  Future<http.Response> records(String _token) {
    return http.get("http://gouud.com/api/ar/Cart/Index?Pageno=0&size=10",
        headers: {"Authorization": "Bearer $_token"});
  }
}
