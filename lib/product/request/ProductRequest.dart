import 'package:http/http.dart' as http;

class ProductRequest {
  Future<http.Response> records(String url) {
    print(url);
    return http.get(url);
  }

  Future<http.Response> addToCart(
      String productId, String quantity, String _token) {
    return http.post(
      "http://gouud.com/api/ar/Cart/AddOrder",
      body: {
        'ProductID': "$productId",
        'Quantity': "$quantity",
      },
      headers: {"Authorization": "Bearer $_token"},
    );
  }
}
