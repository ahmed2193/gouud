import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gouud/UI_EN/bottomHandler.dart';
import 'package:gouud/UI_EN/constants/gouudColors.dart';
import 'package:gouud/login/provider/LoginProvider.dart';
import 'package:gouud/login/uiLogic/Logic.dart';

class Login extends StatefulWidget {
  static const id = 'Login';
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  Logic logic = new Logic();
  Map<String, String> inputs = {};
  String serverError = "";
  String statusCode;
  _onPress() {
    setState(() {
      inputs = logic.validation(emailController.text.trim().toLowerCase(),
          passwordController.text.trim());
    });
  }

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
                          'Email',
                          Icon(
                            Icons.email,
                            color: gouudAppColor,
                          ),
                          emailController,
                          inputs),
                    ],
                  ),
                ),
                new Padding(
                  padding: new EdgeInsets.all(10.0),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Password('Password', passwordController, inputs),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    serverError != ""
                        ? Padding(
                            padding: EdgeInsets.only(left: 15),
                            child: Text(
                              serverError,
                              style: TextStyle(
                                  fontSize: 12, color: gouudErrorTextColor),
                            ))
                        : Container(
                            height: 0,
                          ),
                  ],
                ),
                new Padding(
                  padding: new EdgeInsets.all(20.0),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Container(
                        child: ProgressButton(
                            emailController, passwordController, _onPress, () {
                          setState(() {
                            serverError = 'Email or Password is not valid';
                          });
                          print(inputs);
                        }),
                      ),
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
  Widget inputLogin(label, iconType, controller, inputs) {
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            height: 40,
            width: 260,
            child: new TextField(
              controller: controller,
              decoration: new InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(30.0),
                    ),
                    borderSide: BorderSide(color: gouudAppColor, width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: inputs.isNotEmpty
                        ? inputs[label] != ""
                            ? BorderSide(color: gouudErrorTextColor, width: 2.0)
                            : BorderSide(color: gouudWhite, width: 2.0)
                        : BorderSide(color: gouudWhite, width: 2.0),
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(30.0),
                    ),
                  ),
                  filled: true,
                  hintStyle: new TextStyle(color: gouudGrey, fontSize: 12),
                  hintText: label.toString(),
                  prefixIcon: iconType,
                  fillColor: gouudWhite),
            )),
        inputs.isNotEmpty
            ? inputs[label] != ""
                ? Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      inputs[label],
                      style:
                          TextStyle(fontSize: 12, color: gouudErrorTextColor),
                    ))
                : Container(
                    height: 0,
                  )
            : Container(
                height: 0,
              ),
      ],
    );
  }
}

class Password extends StatefulWidget {
  final String label;
  final Map<String, String> inputs;
  final TextEditingController passwordController;
  Password(this.label, this.passwordController, this.inputs);
  @override
  _PasswordState createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  bool passwordVisible = true;
  @override
  Widget build(BuildContext context) {
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            height: 40,
            width: 260,
            child: new TextField(
              controller: widget.passwordController,
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
                    borderSide: widget.inputs.isNotEmpty
                        ? widget.inputs[widget.label] != ""
                            ? BorderSide(color: gouudErrorTextColor, width: 2.0)
                            : BorderSide(color: gouudWhite, width: 2.0)
                        : BorderSide(color: gouudWhite, width: 2.0),
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
            )),
        (widget.inputs).isNotEmpty
            ? widget.inputs[widget.label] != ""
                ? Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      widget.inputs[widget.label],
                      style:
                          TextStyle(fontSize: 12, color: gouudErrorTextColor),
                    ))
                : Container(
                    height: 0,
                  )
            : Container(
                height: 0,
              ),
      ],
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

class ProgressButton extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final Function() onpress;
  final Function() _serverError;
  ProgressButton(this.emailController, this.passwordController, this.onpress,
      this._serverError);
  @override
  _ProgressButtonState createState() => _ProgressButtonState();
}

class _ProgressButtonState extends State<ProgressButton>
    with TickerProviderStateMixin {
  int _state = 0;
  Animation animation;
  AnimationController _controller;

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: 150,
      height: 40,
      // padding: EdgeInsets.only(top: 60),
      child: ButtonTheme(
        child: RaisedButton(
          animationDuration: Duration(milliseconds: 0),
          color: gouudAppColor,
          onPressed: () {
            widget.onpress();
            setState(() {
              animateButton();
            });
          },
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0),
          ),
          child: setUpButtonChild(),
        ),
      ),
      decoration: BoxDecoration(
          borderRadius: new BorderRadius.circular(30.0),
          border: Border.all(color: gouudWhite)),
    );
  }

  setUpButtonChild() {
    if (_state == 0) {
      return Text(
        "Login",
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      );
    } else if (_state == 1) {
      return SizedBox(
        height: 30,
        width: 30,
        child: CircularProgressIndicator(
          value: null,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      );
    } else {
      return Icon(Icons.check, color: Colors.white);
    }
  }

  void animateButton() {
    _controller =
        AnimationController(duration: Duration(milliseconds: 300), vsync: this);

    animation = Tween(begin: 0.0, end: 1).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
    _controller.forward();

    // setState(() {
    //   _state = 1;
    // });
    Logic logic = new Logic();
    setState(() {
      if (logic
          .validation(widget.emailController.text.trim().toLowerCase(),
              widget.passwordController.text.trim())
          .isEmpty) {
        _state = 1;
      } else {
        _state = 0;
      }
    });

    if (_state == 1) {
      LoginProvider login = new LoginProvider();
      login.getToken(logic.email, logic.password).whenComplete(() {
        setState(() {
          if (login.code == "201") {
            _state = 2;
            Timer(new Duration(milliseconds: 500), () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => BottomHandler()));
            });
          } else {
            widget._serverError();
            _state = 0;
          }
        });
        print(login.code);
      });
    }
  }
}
