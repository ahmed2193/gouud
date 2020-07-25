import 'package:http/http.dart' as http;

class AllBestSellerRequest {
  Future<http.Response> records() {
    return http
        .get("http://brideselection.com/gouud/api/product/allBestSeller");
  }
}
