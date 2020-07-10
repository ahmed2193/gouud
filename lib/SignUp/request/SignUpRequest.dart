import 'package:http/http.dart' as http;

class SignUpRequest {
  Future<http.Response> register(
      name, email, mobile, password, confirmPassword) {
    return http.post("http://gouud.com/api/ar/Login/Register", body: {
      'Name': "$name",
      'Email': "$email",
      'Mobile': "$mobile",
      'Password': "$password",
      'ConfirmPasssword': "$confirmPassword",
    });
  }
}
