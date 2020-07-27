import 'package:http/http.dart' as http;

class FavouriteRequest {
  Future<http.Response> records(int page, _token) {
    return http.get(
        'http://brideselection.com/gouud/api/favourite/records' +
            '/' +
            page.toString() +
            '/10',
        headers: {"Authorization": "Bearer $_token"});
  }
}
