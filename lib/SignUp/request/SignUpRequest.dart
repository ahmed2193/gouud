import 'package:http/http.dart' as http;

class SignUpRequest {
  Future<http.Response> register(
      name, email, phone, password, cpassword, countryId) {
    return http.post("http://brideselection.com/gouud/api/register", body: {
      'name': "$name",
      'email': "$email",
      'phone': "$phone",
      'password': "$password",
      'c_password': "$cpassword",
      'country_id': "$countryId",
    });
  }
}
