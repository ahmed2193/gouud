import 'package:http/http.dart' as http;

class SectionRequest {
  Future<http.Response> records() {
    return http.get("http://plstka.brideselection.com/api/city/records");
  }
}
