import 'package:http/http.dart' as http;

class SectionProductsRequest {
  Future<http.Response> records(String departmentId) {
    return http.get(
        "http://brideselection.com/gouud/api/brand/records/" + departmentId);
  }

  Future<http.Response> ads() {
    return http
        .get("http://brideselection.com/gouud/api/advertisement/records");
  }
}
