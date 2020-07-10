import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gouud/SignUp/provider/SignUpProvider.dart';
import 'package:gouud/SignUp/uiLogic/Logic.dart';
import 'package:gouud/UI_EN/bottomHandler.dart';
import 'package:gouud/UI_EN/constants/gouudColors.dart';

class SignUp extends StatefulWidget {
  static const id = 'SignUp';
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController nameController = new TextEditingController();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController mobileController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  final TextEditingController confirmPasswordController =
      new TextEditingController();
  Logic logic = new Logic();
  Map<String, String> inputs = {};
  String statusCode;
  _onPress() {
    setState(() {
      inputs = logic.validation(
          nameController.text.trim().toLowerCase(),
          emailController.text.trim().toLowerCase(),
          mobileController.text.trim().toLowerCase(),
          passwordController.text.trim(),
          confirmPasswordController.text.trim());
    });
  }

  _foundEmail() {
    setState(() {
      inputs['Email'] = 'Email is already taken.';
      inputs['Full name'] = '';
      inputs['Confirm password'] = '';
      inputs['Password'] = '';
      inputs['Mobile number'] = '';
    });
    print(inputs);
  }

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
                            'Full name',
                            Icon(
                              Icons.person,
                              color: gouudAppColor,
                            ),
                            nameController,
                            inputs),
                      ],
                    ),
                  ),

                  new Padding(
                    padding: new EdgeInsets.all(8.0),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        inputSignUp(
                            'Mobile number',
                            Padding(
                                padding: EdgeInsets.only(
                                    top: 10, left: 10, bottom: 10),
                                child: Text(
                                  '+2',
                                  style: TextStyle(color: gouudAppColor),
                                )),
                            mobileController,
                            inputs),
                      ],
                    ),
                  ),
                  // new Country(),
                  // new Padding(
                  //   padding: new EdgeInsets.all(8.0),
                  //   child: new Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: <Widget>[
                  //       inputMobile(
                  //           'Mobile number',
                  //           Icon(
                  //             Icons.person,
                  //             color: gouudAppColor,
                  //           ),
                  //           mobileController,
                  //           inputs),
                  //     ],
                  //   ),
                  // ),
                  new Padding(
                    padding: new EdgeInsets.all(8.0),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        inputSignUp(
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
                    padding: new EdgeInsets.all(8.0),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Password('Password', passwordController, inputs),
                      ],
                    ),
                  ),
                  new Padding(
                    padding: new EdgeInsets.all(8.0),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Password('Confirm password',
                            confirmPasswordController, inputs),
                      ],
                    ),
                  ),
                  new Padding(
                    padding: new EdgeInsets.all(8.0),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Container(
                          child: ProgressButton(
                              nameController,
                              emailController,
                              mobileController,
                              passwordController,
                              confirmPasswordController,
                              _onPress,
                              _foundEmail),
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
  Widget signUpButton(label, _onPress) {
    return new Container(
      width: 150,
      height: 40,
      // padding: EdgeInsets.only(top: 60),
      child: ButtonTheme(
        child: RaisedButton(
          color: gouudAppColor,
          onPressed: _onPress,
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
  Widget inputSignUp(label, iconType, controller, inputs) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        new Container(
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

  // Widget error()
  Widget inputMobile(label, iconType, controller, inputs) {
    return new Column(
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
  final TextEditingController controller;
  final Map<String, String> inputs;
  Password(this.label, this.controller, this.inputs);
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
              controller: widget.controller,
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

class ProgressButton extends StatefulWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController mobileController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final Function() onpress;
  final Function() _foundEmail;
  ProgressButton(
      this.nameController,
      this.emailController,
      this.mobileController,
      this.passwordController,
      this.confirmPasswordController,
      this.onpress,
      this._foundEmail);
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
        "Create",
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
          .validation(
              widget.nameController.text.trim().toLowerCase(),
              widget.emailController.text.trim().toLowerCase(),
              widget.mobileController.text.trim().toLowerCase(),
              widget.passwordController.text.trim(),
              widget.confirmPasswordController.text.trim())
          .isEmpty) {
        _state = 1;
      } else {
        _state = 0;
      }
    });

    if (_state == 1) {
      SignUpProvider signUpP = new SignUpProvider();
      signUpP
          .register(logic.name, logic.email, logic.mobile, logic.password,
              logic.confirmPassword)
          .whenComplete(() {
        setState(() {
          if (signUpP.code == "200") {
            _state = 2;
            signUpP.getToken(logic.email, logic.password).whenComplete(() {
              print('done');
              if (signUpP.tokenCode == "200") {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) => BottomHandler()));
              } else {
                print('enternal server error ');
              }
            });
          } else {
            widget._foundEmail();
            _state = 0;
          }
        });
        print(signUpP.code);
      });
    }
  }
}
