import 'package:http/http.dart' as http;

class ProductRequest {
  Future<http.Response> records(String url) {
    print(url);
    return http.get(url);
  }
}
