import 'package:flutter/material.dart';
import 'package:gouud/UI_EN/constants/gouudColors.dart';

class ForgetPassword extends StatefulWidget {
  static const id = 'ForgetPassword';
  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: bar(),
        ),
        // resizeToAvoidBottomInset: false,
        backgroundColor: gouudBackgroundColor,
        extendBodyBehindAppBar: true,
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
                  padding: new EdgeInsets.only(top: 120),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleIcon(),
                    ],
                  ),
                ),
                new Padding(
                  padding: new EdgeInsets.all(40.0),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Column(
                        children: <Widget>[
                          Text('PASSWORD RECOVERY',
                              style: TextStyle(
                                  fontSize: 20, color: Colors.black45)),
                          Text('Change the password to retreive it now',
                              style: TextStyle(
                                  fontSize: 10, color: Colors.black26))
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
                      inputMobile(
                          'MOBILE NUMBER',
                          Icon(
                            Icons.person,
                            color: gouudGrey,
                          )),
                    ],
                  ),
                ),
                new Padding(
                  padding: new EdgeInsets.all(20.0),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      recoveryButton('RECOVERY'),
                    ],
                  ),
                ),
              ])
            ])));
  }

  /// button widget
  Widget recoveryButton(label) {
    return new Container(
      width: 260,
      height: 40,
      child: ButtonTheme(
        child: RaisedButton(
          color: gouudAppColor,
          onPressed: () {
            Navigator.pushReplacementNamed(context, 'PasswordVerification');
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

  Widget inputMobile(label, iconType) {
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
            prefixIcon: Container(
                decoration: new BoxDecoration(
                  color: gouudAppColor,
                  borderRadius: const BorderRadius.only(
                      bottomLeft: const Radius.circular(30.0),
                      topLeft: const Radius.circular(30.0)),
                ),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    '+2 EG',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: gouudWhite),
                  ),
                )),
            fillColor: gouudWhite,
          ),
        ));
  }

  Widget bar() {
    return PreferredSize(
        preferredSize: const Size(double.infinity, 40),
        child: Container(
          height: 40.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, 'Login');
                  },
                  child: new Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Icon(
                        Icons.arrow_back,
                        color: gouudAppColor,
                        size: 30,
                      )))
            ],
          ),
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
              border: new OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  const Radius.circular(30.0),
                ),
              ),
              filled: true,
              hintStyle: new TextStyle(color: gouudGrey, fontSize: 12),
              hintText: widget.label,
              prefixIcon: Icon(
                Icons.lock,
                color: gouudGrey,
              ),
              suffixIcon: IconButton(
                // onPressed: () => _controller.clear(),
                icon: Icon(
                  passwordVisible ? Icons.visibility_off : Icons.visibility,
                  color: gouudGrey,
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

class CircleIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double size = 100.0;

    return new Container(
      width: size,
      height: size,
      decoration: new BoxDecoration(
        color: gouudAppColor,
        shape: BoxShape.circle,
      ),
      child: Icon(
        Icons.vpn_key,
        size: 60,
        color: gouudWhite,
      ),
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
