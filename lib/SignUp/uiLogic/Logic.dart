// class Logic {
//   String mobilePattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
//   String emailPattern =
//       r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
//   String passwordPattern = r"^.{6,32}$";
//   String name;
//   String email;
//   String mobile;
//   String password;
//   String confirmPassword;
//   String countryId;
//   String statusCode;

//   Map<String, String> validation(
//       name, email, mobile, password, confirmPassword, countryId) {
//     this.name = name;
//     this.email = email;
//     this.mobile = mobile;
//     this.password = password;
//     this.confirmPassword = confirmPassword;
//     this.countryId = countryId;

//     Map<String, String> result = {};
//     String emailValid = regValidatation(email, emailPattern);
//     String mobileValid = regValidatation(mobile, mobilePattern);
//     String passwordValid = regValidatation(password, passwordPattern);

//     if (emailValid == 'not valid') {
//       result['Email'] = 'Email cannot be null or empty';
//     } else if (emailValid == 'empty') {
//       result['Email'] = 'Email cannot be null or empty';
//     } else {
//       result['Email'] = '';
//     }

      
//     if (mobileValid == 'not valid') {
//       result['Mobile'] = 'Mobile Is Required';
//     } else if (mobileValid == 'empty') {
//       result['Mobile'] = 'Mobile Is Required';
//     } else {
//       result['Mobile'] = '';
//     }

//     if (passwordValid == 'not valid') {
//       result['Password'] = 'Password Is Required';
//       result['ConfirmPasssword'] = '';
//     } else if (passwordValid == 'empty') {
//       result['Password'] = 'Password Is Required';
//       result['ConfirmPasssword'] = '';
//     } else {
//       if (password != confirmPassword) {
//         result['Password'] = '';
      //  result['ConfirmPasssword'] = 'Password and ConfirmPassword Must Be Same ';
//       } else {
//         result['Password'] = '';
//         result['ConfirmPasssword'] = '';
//       }
//     }
//     if (name == '') {
//       result['Full name'] = 'Name Is Required';
//     } else {
//       result['Full name'] = '';
//     }
//     // if (countryId == '') {
//     //   result['CountryId'] = 'Country Is Not Exist';
//     // } else {
//     //   result['CountryId'] = '';
//     // }
//     if (result['Full name'] == '' &&
//         result['ConfirmPasssword'] == '' &&
//         result['Password'] == '' &&
//         result['Mobile'] == '' && 
//         // result['CountryId'] == '' &&
//         result['Email'] == '') {
//       return {};
//     } else {
//       return result;
//     }
//   }

//   String regValidatation(String value, String pattern) {
//     RegExp regExp = new RegExp(pattern);
//     if (value.length == 0) {
//       return 'empty';
//     } else if (!regExp.hasMatch(value)) {
//       return 'not valid';
//     } else {
//       return 'valid';
//     }
//   }
// }
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
  String countryId;
  String statusCode;

  Map<String, String> validation(
      name, email, mobile, password, confirmPassword, countryId) {
    this.name = name;
    this.email = email;
    this.mobile = mobile;
    this.password = password;
    this.confirmPassword = confirmPassword;
    this.countryId = countryId;

    Map<String, String> result = {};
    String emailValid = regValidatation(email, emailPattern);
    String mobileValid = regValidatation(mobile, mobilePattern);
    String passwordValid = regValidatation(password, passwordPattern);

    if (emailValid == 'not valid') {
      result['Email'] = 'Email cannot be null or empty';
    } else if (emailValid == 'empty') {
      result['Email'] = 'Email cannot be null or empty';
    } else {
      result['Email'] = '';
    }

    if (mobileValid == 'not valid') {
      result['Mobile number'] = 'Mobile Is Required';
    } else if (mobileValid == 'empty') {
      result['Mobile number'] = 'Mobile Is Required';
    } else {
      result['Mobile number'] = '';
    }

    if (passwordValid == 'not valid') {
      result['Password'] = 'Password Is Required';
      result['Confirm password'] = '';
    } else if (passwordValid == 'empty') {
      result['Password'] = 'Password Is Required';
      result['Confirm password'] = '';
    } else {
      if (password != confirmPassword) {
        result['Password'] = '';
        result['Confirm password'] = 'Password and ConfirmPassword Must Be Same';
      } else {
        result['Password'] = '';
        result['Confirm password'] = '';
      }
    }
    if (name == '') {
      result['Full name'] = 'Name Is Required';
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

