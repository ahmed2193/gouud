class Logic {
  String email;
  String password;
  String statusCode;

  Map<String, String> validation(email, password) {
    this.email = email;
    this.password = password;

    Map<String, String> result = {};

    if (email == '') {
      result['Email'] = 'Please enter your email';
    } else {
      result['Email'] = '';
    }

    if (password == '') {
      result['Password'] = 'Please enter your password';
    } else {
      result['Password'] = '';
    }

    if (result['Password'] == '' && result['Email'] == '') {
      return {};
    } else {
      return result;
    }
  }
}
