import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gouud/UI_EN/SelectLanguage.dart';
import 'package:gouud/UI_EN/bottomHandler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  static const id = 'SplashScreen';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  _goToHomepage(BuildContext context) async {
    await Future.delayed(Duration(seconds: 0));
    final prefs = await SharedPreferences.getInstance();
    if ((prefs.getBool('Inner') ?? false)) {
      Navigator.pushNamedAndRemoveUntil(
          context, BottomHandler.id, (r) => false);
    } else {
      Navigator.pushNamedAndRemoveUntil(
          context, SelectLanguage.id, (r) => false);
    }
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _goToHomepage(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/icons/logo-screen.png'),
            )),
          ),
        ],
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/icons/screen-background.png'),
            fit: BoxFit.cover),
      ),
    );
  }
}
