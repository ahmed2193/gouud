import 'package:http/http.dart' as http;

class ProductsRequest {
  Future<http.Response> records(String id, int page) {
    print(id);
    return http.get('http://brideselection.com/gouud/api/product/records/' +
        id +
        '/' +
        page.toString() +
        '/10');
  }
}
