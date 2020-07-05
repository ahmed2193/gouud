import 'package:flutter/material.dart';
import 'package:gouud/UI_EN/constants/gouudColors.dart';

class ResetPassword extends StatefulWidget {
  static const id = 'ResetPassword';
  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: bar(),
        ),
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
                                  fontSize: 20, color: gouudBlackFontColor)),
                          Text('Great, you can change your password ',
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
                      PasswordInput('PASSWORD'),
                    ],
                  ),
                ),
                new Padding(
                  padding: new EdgeInsets.all(10.0),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      PasswordInput('CONFIRM PASSWORD'),
                    ],
                  ),
                ),
                new Padding(
                  padding: new EdgeInsets.all(20.0),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      resetButton('CONFRIM'),
                    ],
                  ),
                ),
              ])
            ])));
  }

  /// button widget
  Widget resetButton(label) {
    return new Container(
      width: 260,
      height: 40,
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
          // decoration: new BoxDecoration(
          //   color: backgroundColor,
          //   boxShadow: [BoxShadow(color: gouudWhite, spreadRadius: 1)],
          //   borderRadius: BorderRadius.vertical(bottom: Radius.circular(40.0)),
          // ),
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

class PasswordInput extends StatefulWidget {
  final String label;
  PasswordInput(this.label);
  @override
  _PasswordInputState createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
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
