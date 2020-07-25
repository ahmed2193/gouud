import 'package:http/http.dart' as http;

class HomeRequest {
  Future<http.Response> records() {
    return http.get("http://brideselection.com/gouud/api/brand/recordsHome");
  }
}
