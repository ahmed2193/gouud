import 'package:http/http.dart' as http;

class SectionProductsRequest {
  Future<http.Response> records(String url) {
    return http.get(url);
  }
}
