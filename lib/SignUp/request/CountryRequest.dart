import 'package:http/http.dart' as http;

class CountryRequest {
  Future<http.Response> records() {
    return http.get("http://brideselection.com/gouud/api/country/records");
  }
}
