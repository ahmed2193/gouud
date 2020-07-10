import 'package:flutter/material.dart';
import 'package:gouud/UI_EN/constants/gouudColors.dart';

class SignUp extends StatefulWidget {
  static const id = 'SignUp';
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        // resizeToAvoidBottomInset: false,
        backgroundColor: gouudBackgroundColor,
        body: ScrollConfiguration(
            behavior: MyBehavior(),
            child: Stack(
              children: <Widget>[
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
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            image: AssetImage('assets/icons/logo-screen.png'),
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
                        new Column(
                          children: <Widget>[
                            Text('LET\'S GET STARTED',
                                style: TextStyle(
                                    fontSize: 20, color: gouudBlackFontColor)),
                            Text('CREATE AN ACCOUNT TO FUTURE',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black26))
                          ],
                        ),
                      ],
                    ),
                  ),
                  new Padding(
                    padding: new EdgeInsets.all(8.0),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        inputSignUp(
                            'FULL NAME',
                            Icon(
                              Icons.person,
                              color: gouudAppColor,
                            )),
                      ],
                    ),
                  ),
                  new Country(),
                  new Padding(
                    padding: new EdgeInsets.all(8.0),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        inputSignUp(
                            'EMAIL',
                            Icon(
                              Icons.email,
                              color: gouudAppColor,
                            )),
                      ],
                    ),
                  ),
                  new Padding(
                    padding: new EdgeInsets.all(8.0),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Password('PASSWORD'),
                      ],
                    ),
                  ),
                  new Padding(
                    padding: new EdgeInsets.all(8.0),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Password('CONFIRM PASSWORD'),
                      ],
                    ),
                  ),
                  new Padding(
                    padding: new EdgeInsets.all(8.0),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        signUpButton('CREATE'),
                      ],
                    ),
                  ),
                  new Padding(
                    padding: new EdgeInsets.all(8.0),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Container(
                            child: Text('SIGN UP WITH',
                                style: TextStyle(
                                    fontSize: 12, color: gouudBlackFontColor))),
                      ],
                    ),
                  ),
                  new Padding(
                    padding: new EdgeInsets.all(8.0),
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
                            child: Text('ALREADY HAVE AN ACCOUNT? ',
                                style: TextStyle(
                                    fontSize: 12, color: gouudBlackFontColor))),
                        new GestureDetector(
                            onTap: () {
                              Navigator.pushReplacementNamed(context, 'Login');
                            },
                            child: new Container(
                                child: Text('  SIGN IN',
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
                        ),
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
              ],
            )));
  }

  /// button widget
  Widget signUpButton(label) {
    return new Container(
      width: 150,
      height: 40,
      // padding: EdgeInsets.only(top: 60),
      child: ButtonTheme(
        child: RaisedButton(
          color: gouudAppColor,
          onPressed: () {
            Navigator.pushReplacementNamed(context, 'SignUpVerification');
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
  Widget inputSignUp(label, iconType) {
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

class Country extends StatefulWidget {
  @override
  _CountryState createState() => _CountryState();
}

class _CountryState extends State<Country> {
  String dropdownValue = 'Goats';
  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        // new Padding(
        //   padding: new EdgeInsets.all(8.0),
        //   child: new Row(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: <Widget>[
        //       inputCountry(
        //           'FULL NAME',
        //           Icon(
        //             Icons.location_on,
        //             color: gouudWhite,
        //           )),
        //     ],
        //   ),
        // ),
        new Padding(
          padding: new EdgeInsets.all(8.0),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              inputMobile(
                  'MOBILE NUMBER',
                  Icon(
                    Icons.person,
                    color: gouudAppColor,
                  )),
            ],
          ),
        ),
      ],
    );
  }

  Widget inputCountry(label, iconType) {
    return new Container(
        height: 40,
        width: 260,
        child: new InputDecorator(
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
              width: 62,
              decoration: new BoxDecoration(
                color: gouudAppColor,
                borderRadius: const BorderRadius.only(
                    bottomLeft: const Radius.circular(30.0),
                    topLeft: const Radius.circular(30.0)),
              ),
              child: iconType,
            ),
            fillColor: gouudWhite,
          ),
          child: FutureBuilder<List<String>>(
            future: _getData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                  value: dropdownValue,
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    color: Colors.grey,
                  ),
                  iconSize: 24,
                  elevation: 16,
                  isExpanded: true,
                  style: TextStyle(color: gouudBackgroundColor),
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValue = newValue;
                    });
                  },
                  items: snapshot.data
                      .map((item) => DropdownMenuItem<String>(
                            child: Text(item),
                            value: item,
                          ))
                      .toList(),
                ));
              } else if (snapshot.hasError) {
                return Text("");
              }

              return new Align(
                child: CircularProgressIndicator(),
                alignment: FractionalOffset.topLeft,
              );
            },
          ),
        ));
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
            prefixIcon: Padding(
                padding: EdgeInsets.only(right: 10),
                child: Container(
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
                    ))),
            fillColor: gouudWhite,
          ),
        ));
  }

  Future<List<String>> _getData() async {
    var values = new List<String>();
    values.add("Horses");
    values.add("Goats");
    values.add("Chickens");
    //throw new Exception("Danger Will Robinson!!!");
    await new Future.delayed(new Duration(seconds: 5));
    return values;
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
