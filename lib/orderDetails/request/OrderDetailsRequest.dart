import 'package:http/http.dart' as http;

class OrderDetailsRequest {
  Future<http.Response> records() {
    return http.get("http://plstka.brideselection.com/api/city/records");
  }
}
