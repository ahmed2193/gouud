import 'package:http/http.dart' as http;

class ProductRequest {
  Future<http.Response> records(String id) {
    print(id);
    return http.get("http://brideselection.com/gouud/api/product/record/" + id);
  }

  Future<http.Response> comments(String id) {
    print(id);
    return http
        .get("http://brideselection.com/gouud/api/comment/records/" + id);
  }

  Future<http.Response> setComment(
      String productId, String comment, String rate, String _token) {
    return http.post(
      "http://brideselection.com/gouud/api/comment/create",
      body: {
        'product_id': "$productId",
        'text': "$comment",
        'rate': "$rate",
      },
      headers: {"Authorization": "Bearer $_token"},
    );
  }

  Future<http.Response> addToCart(
      String productId, String quantity, String _token) {
    return http.post(
      "http://gouud.com/api/ar/Cart/AddProduct",
      body: {
        'ProductID': "$productId",
        'Quantity': "$quantity",
      },
      headers: {"Authorization": "Bearer $_token"},
    );
  }
}
