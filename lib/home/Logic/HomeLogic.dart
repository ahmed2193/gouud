import 'package:shared_preferences/shared_preferences.dart';

class HomeLogic {
  bool inner;
  checkLogin() async {
    final prefs = await SharedPreferences.getInstance();
    this.inner = prefs.getBool('Inner') ?? false;
    if (inner) {
      return true;
    } else {
      prefs.setString('ReturnedPage', 'Home');
    }
  }
}
