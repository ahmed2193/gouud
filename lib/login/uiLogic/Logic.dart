class Logic {
  String email;
  String password;
  String statusCode;

  Map<String, String> validation(email, password) {
    this.email = email;
    this.password = password;

    Map<String, String> result = {};

    if (email == '') {
      result['Email'] = 'The user name or password is incorrect.';
    } else {
      result['Email'] = '';
    }

    if (password == '') {
      result['Password'] = 'The user name or password is incorrect.';
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
