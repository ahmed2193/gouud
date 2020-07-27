import 'package:shared_preferences/shared_preferences.dart';

class ProductLogic {
  bool inner;
  checkLogin(String id) async {
    final prefs = await SharedPreferences.getInstance();
    this.inner = prefs.getBool('Inner') ?? false;
    if (inner) {
      return true;
    } else {
      prefs.setString('ReturnedPage', 'Product');
      prefs.setString('ReturnedProduct', id);
    }
  }
}
