import 'package:http/http.dart' as http;

class BestSellerRequest {
  Future<http.Response> records() {
    return http.get("http://brideselection.com/gouud/api/product/bestSeller");
  }
}
