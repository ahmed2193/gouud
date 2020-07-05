import 'package:http/http.dart' as http;

class ProductsRequest {
  Future<http.Response> records(String url) {
    print(url);
    return http.get(url);
  }
}
