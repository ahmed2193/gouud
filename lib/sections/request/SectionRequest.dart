import 'package:http/http.dart' as http;

class SectionRequest {
  Future<http.Response> records() {
    return http.get("http://gouud.com/api/ar/Departments/Main");
  }
}
