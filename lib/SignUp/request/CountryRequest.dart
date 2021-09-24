import 'package:http/http.dart' as http;

class CountryRequest {
     Map<String,String> _header={
"Content-Type" :"application/json; charset=utf-8",
 };
  Future<http.Response> records() {
    return http.get("http://gouud.com/api/ar/Countries/all" , headers: _header);
  }
}
