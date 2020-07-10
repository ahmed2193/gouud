class Logic {
  String mobilePattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
  String emailPattern =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  String passwordPattern = r"^.{6,32}$";
  String name;
  String email;
  String mobile;
  String password;
  String confirmPassword;
  String statusCode;

  Map<String, String> validation(
      name, email, mobile, password, confirmPassword) {
    this.name = name;
    this.email = email;
    this.mobile = mobile;
    this.password = password;
    this.confirmPassword = confirmPassword;

    Map<String, String> result = {};
    String emailValid = regValidatation(email, emailPattern);
    String mobileValid = regValidatation(mobile, mobilePattern);
    String passwordValid = regValidatation(password, passwordPattern);

    if (emailValid == 'not valid') {
      result['Email'] = 'email not valid';
    } else if (emailValid == 'empty') {
      result['Email'] = 'Please enter your email';
    } else {
      result['Email'] = '';
    }

    if (mobileValid == 'not valid') {
      result['Mobile number'] = 'mobile not valid';
    } else if (mobileValid == 'empty') {
      result['Mobile number'] = 'Please enter your mobile';
    } else {
      result['Mobile number'] = '';
    }

    if (passwordValid == 'not valid') {
      result['Password'] = 'password not valid';
      result['Confirm password'] = '';
    } else if (passwordValid == 'empty') {
      result['Password'] = 'Please enter your password';
      result['Confirm password'] = '';
    } else {
      if (password != confirmPassword) {
        result['Password'] = '';
        result['Confirm password'] = 'Password isn\'t match Confirm password ';
      } else {
        result['Password'] = '';
        result['Confirm password'] = '';
      }
    }
    if (name == '') {
      result['Full name'] = 'Please enter your name';
    } else {
      result['Full name'] = '';
    }
    if (result['Full name'] == '' &&
        result['Confirm password'] == '' &&
        result['Password'] == '' &&
        result['Mobile number'] == '' &&
        result['Email'] == '') {
      return {};
    } else {
      return result;
    }
  }

  String regValidatation(String value, String pattern) {
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return 'empty';
    } else if (!regExp.hasMatch(value)) {
      return 'not valid';
    } else {
      return 'valid';
    }
  }
}
