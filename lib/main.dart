import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:gouud/SplashScreen.dart';
import 'package:gouud/UI_EN/BestSeller.dart';
import 'package:gouud/UI_EN/Favourite.dart';
import 'package:gouud/UI_EN/ForgetPassword.dart';
import 'package:gouud/UI_EN/Login.dart';
import 'package:gouud/UI_EN/Home.dart';
import 'package:gouud/aboutApp/view/AboutApp.dart';
import 'package:gouud/cart/view/Cart.dart';
import 'package:gouud/orderDetails/view/OrderDetails.dart';
import 'package:gouud/orders/view/Orders.dart';
import 'package:gouud/personal/view/Personal.dart';
import 'package:gouud/sections/provider/SectionsProvider.dart';
import 'package:gouud/sections/view/Sections.dart';
import 'package:gouud/UI_EN/SelectLanguage.dart';
import 'package:gouud/UI_EN/PasswordVerification.dart';
import 'package:gouud/UI_EN/SignUpVerification.dart';
import 'package:gouud/UI_EN/ResetPassword.dart';
import 'package:gouud/UI_EN/SignUp.dart';
import 'package:gouud/UI_EN/bottomHandler.dart';

void main() async {
  runApp(ChangeNotifierProvider<SectionsProvider>(
      create: (context) => SectionsProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return getLanguageTheme('en');
  }

  Widget getLanguageTheme(language) {
    if (language == 'en') {
      return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'jannatEn',
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: {
          SplashScreen.id: (context) => SplashScreen(),
          SignUp.id: (context) => SignUp(),
          Login.id: (context) => Login(),
          ForgetPassword.id: (context) => ForgetPassword(),
          PasswordVerification.id: (context) => PasswordVerification(),
          SignUpVerification.id: (context) => SignUpVerification(),
          SelectLanguage.id: (context) => SelectLanguage(),
          ResetPassword.id: (context) => ResetPassword(),
          Sections.id: (context) => Sections(),
          BottomHandler.id: (context) => BottomHandler(),
          Home.id: (context) => Home(),
          BestSeller.id: (context) => BestSeller(),
          OrderDetails.id: (context) => OrderDetails(),
          Personal.id: (context) => Personal(),
          Favourite.id: (context) => Favourite(),
          Cart.id: (context) => Cart(),
          Orders.id: (context) => Orders(),
          AboutApp.id: (context) => AboutApp(),
        },
        home: SplashScreen(),
      );
    } else {
      return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'jannatAr',
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: {
          SplashScreen.id: (context) => SplashScreen(),
          SignUp.id: (context) => SignUp(),
          Login.id: (context) => Login(),
          ForgetPassword.id: (context) => ForgetPassword(),
          PasswordVerification.id: (context) => PasswordVerification(),
          SignUpVerification.id: (context) => SignUpVerification(),
          SelectLanguage.id: (context) => SelectLanguage(),
          ResetPassword.id: (context) => ResetPassword(),
          Sections.id: (context) => Sections(),
          BottomHandler.id: (context) => BottomHandler(),
          Home.id: (context) => Home(),
          BestSeller.id: (context) => BestSeller(),
          OrderDetails.id: (context) => OrderDetails(),
          Personal.id: (context) => Personal(),
          Favourite.id: (context) => Favourite(),
          Cart.id: (context) => Cart(),
          Orders.id: (context) => Orders(),
          AboutApp.id: (context) => AboutApp(),
        },
        home: SplashScreen(),
      );
    }
  }
}