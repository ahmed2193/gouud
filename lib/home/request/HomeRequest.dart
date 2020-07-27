import 'package:http/http.dart' as http;

class HomeRequest {
  Future<http.Response> records() {
    return http.get("http://brideselection.com/gouud/api/brand/recordsHome");
  }

  Future<http.Response> advertisement() {
    return http
        .get("http://brideselection.com/gouud/api/advertisement/records");
  }

  Future<http.Response> addToCart(productId, quantity, _token) {
    return http.post("http://brideselection.com/gouud/api/addToCart",
        body: {'product_id': "$productId", 'quantity': "$quantity"},
        headers: {"Authorization": "Bearer $_token"});
  }

  Future<http.Response> addTofavourite(productId, _token) {
    return http.post("http://brideselection.com/gouud/api/favourite/create",
        body: {'product_id': "$productId"},
        headers: {"Authorization": "Bearer $_token"});
  }
}
