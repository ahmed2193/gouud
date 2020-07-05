import 'package:flutter/material.dart';
import 'package:gouud/UI_EN/constants/gouudColors.dart';

class Login extends StatefulWidget {
  static const id = 'Login';
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        // resizeToAvoidBottomInset: false,
        backgroundColor: gouudBackgroundColor,
        body: ScrollConfiguration(
            behavior: MyBehavior(),
            child: Stack(children: <Widget>[
              new Container(
                decoration: new BoxDecoration(
                    image: new DecorationImage(
                        image: new AssetImage(
                            "assets/icons/screen-background.png"),
                        fit: BoxFit.cover)),
              ),
              ListView(children: <Widget>[
                new Padding(
                  padding: new EdgeInsets.all(10.0),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(top: 200),
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image: AssetImage('assets/icons/logo-screen.png'),
                        )),
                      ),
                    ],
                  ),
                ),
                new Padding(
                  padding: new EdgeInsets.all(10.0),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Column(
                        children: <Widget>[
                          Text('WELCOME BACK!',
                              style: TextStyle(
                                  fontSize: 20, color: gouudBlackFontColor)),
                          Text('LOG IN TO YOUR ACCOUNT OF gouud',
                              style: TextStyle(
                                  fontSize: 12, color: Colors.black26))
                        ],
                      ),
                    ],
                  ),
                ),
                new Padding(
                  padding: new EdgeInsets.all(10.0),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      inputLogin(
                          'FULL NAME',
                          Icon(
                            Icons.person,
                            color: gouudAppColor,
                          )),
                    ],
                  ),
                ),
                new Padding(
                  padding: new EdgeInsets.all(10.0),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Password('PASSWORD'),
                    ],
                  ),
                ),
                new Padding(
                  padding: new EdgeInsets.all(3.0),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      new Container(
                        width: 60,
                        child: Text(''),
                      ),
                      new GestureDetector(
                          onTap: () =>
                              {Navigator.pushNamed(context, 'ForgetPassword')},
                          child: new Container(
                              child: Text('FORGET PASSWORD?',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: gouudAppColor,
                                  ))))
                    ],
                  ),
                ),
                new Padding(
                  padding: new EdgeInsets.all(20.0),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      loginButton('LOG IN'),
                    ],
                  ),
                ),
                new Padding(
                  padding: new EdgeInsets.all(20.0),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Container(
                          child: Text('SIGN IN WITH',
                              style: TextStyle(
                                  fontSize: 12, color: gouudBlackFontColor))),
                    ],
                  ),
                ),
                new Padding(
                  padding: new EdgeInsets.all(20.0),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image: AssetImage('assets/icons/facebook.png'),
                        )),
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image: AssetImage('assets/icons/twitter.png'),
                        )),
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image: AssetImage('assets/icons/gmail.png'),
                        )),
                      ),
                    ],
                  ),
                ),
                new Padding(
                  padding: new EdgeInsets.all(8.0),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Container(
                          child: Text('DOESN\'T HAVE AN ACCOUNT? ',
                              style: TextStyle(
                                  fontSize: 12, color: gouudBlackFontColor))),
                      new GestureDetector(
                          onTap: () => {Navigator.pushNamed(context, 'SignUp')},
                          child: new Container(
                              child: Text('  SIGN UP',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: gouudAppColor,
                                  ))))
                    ],
                  ),
                ),
                new Padding(
                  padding: new EdgeInsets.all(8.0),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, 'BottomHandler');
                        },
                        child: new Container(
                            child: Text('SKIP',
                                style: TextStyle(
                                    fontSize: 12, color: gouudAppColor))),
                      )
                    ],
                  ),
                ),
                new Padding(
                  padding: new EdgeInsets.all(0.0),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Container(
                          child: Text(
                        '',
                      )),
                    ],
                  ),
                )
              ])
            ])));
  }

  /// button widget
  Widget loginButton(label) {
    return new Container(
      width: 150,
      height: 40,
      // padding: EdgeInsets.only(top: 60),
      child: ButtonTheme(
        child: RaisedButton(
          color: gouudAppColor,
          onPressed: () {
            Navigator.pushNamed(context, 'BottomHandler');
          },
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0),
          ),
          child: Text(label.toString(),
              style: TextStyle(fontSize: 16, color: gouudWhite)),
        ),
      ),
      decoration: BoxDecoration(
          borderRadius: new BorderRadius.circular(30.0),
          border: Border.all(color: gouudWhite)),
    );
  }

  /// text input widget
  Widget inputLogin(label, iconType) {
    return new Container(
        height: 40,
        width: 260,
        child: new TextField(
          decoration: new InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  const Radius.circular(30.0),
                ),
                borderSide: BorderSide(color: gouudAppColor, width: 2.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: gouudWhite, width: 2.0),
                borderRadius: const BorderRadius.all(
                  const Radius.circular(30.0),
                ),
              ),
              filled: true,
              hintStyle: new TextStyle(color: gouudGrey, fontSize: 12),
              hintText: label.toString(),
              prefixIcon: iconType,
              fillColor: gouudWhite),
        ));
  }
}

class Password extends StatefulWidget {
  final String label;
  Password(this.label);
  @override
  _PasswordState createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  bool passwordVisible = true;
  @override
  Widget build(BuildContext context) {
    return new Container(
        height: 40,
        width: 260,
        child: new TextField(
          cursorColor: gouudAppColor,
          keyboardType: TextInputType.visiblePassword,
          obscureText: passwordVisible,
          decoration: new InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  const Radius.circular(30.0),
                ),
                borderSide: BorderSide(color: gouudAppColor, width: 2.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: gouudWhite, width: 2.0),
                borderRadius: const BorderRadius.all(
                  const Radius.circular(30.0),
                ),
              ),
              filled: true,
              hintStyle: new TextStyle(color: gouudGrey, fontSize: 12),
              hintText: widget.label,
              prefixIcon: Icon(
                Icons.lock,
                color: gouudAppColor,
              ),
              suffixIcon: IconButton(
                // onPressed: () => _controller.clear(),
                icon: Icon(
                  passwordVisible ? Icons.visibility_off : Icons.visibility,
                  color: gouudAppColor,
                ),
                onPressed: () {
                  setState(() {
                    passwordVisible = !passwordVisible;
                  });
                },
              ),
              fillColor: gouudWhite),
        ));
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
