import 'package:flutter/material.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:gouud/UI_EN/constants/gouudColors.dart';

class SignUpVerification extends StatefulWidget {
  static const id = 'SignUpVerification';
  @override
  _SignUpVerificationState createState() => _SignUpVerificationState();
}

class _SignUpVerificationState extends State<SignUpVerification> {
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
                          Text('VERIFICATION CODE',
                              style: TextStyle(
                                  fontSize: 20, color: gouudBlackFontColor)),
                          Text('Please, enter your activation code',
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
                      PinInput(),
                    ],
                  ),
                ),
                new Padding(
                  padding: new EdgeInsets.all(20.0),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      sendButton('SEND'),
                    ],
                  ),
                ),
                new Padding(
                  padding: new EdgeInsets.all(3.0),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new GestureDetector(
                          onTap: () => {},
                          child: new Container(
                              child: Text('RESEND CODE',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: gouudAppColor,
                                  ))))
                    ],
                  ),
                ),
              ])
            ])));
  }

  /// button widget
  Widget sendButton(label) {
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
          //   boxShadow: [BoxShadow(color: white, spreadRadius: 1)],
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

class PinInput extends StatefulWidget {
  @override
  _PinInputState createState() => _PinInputState();
}

class _PinInputState extends State<PinInput> {
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();
  BoxDecoration pinPutDecoration = BoxDecoration(
    color: gouudWhite,
    borderRadius: BorderRadius.circular(50),
    border: Border.all(color: gouudAppColor),
  );
  @override
  Widget build(BuildContext context) {
    return new Container(
      width: 260,
      child: Center(
        child: PinPut(
          eachFieldWidth: 50,
          eachFieldHeight: 50,
          fieldsCount: 5,
          // onSubmit: (String pin) => _onPressed(pin),
          focusNode: _pinPutFocusNode,
          controller: _pinPutController,
          submittedFieldDecoration: pinPutDecoration,
          selectedFieldDecoration: pinPutDecoration,
          followingFieldDecoration: pinPutDecoration,
          pinAnimationType: PinAnimationType.scale,
          textStyle: TextStyle(color: gouudAppColor, fontSize: 20),
        ),
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
