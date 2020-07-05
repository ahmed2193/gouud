import 'package:flutter/material.dart';
import 'package:gouud/UI_EN/constants/gouudColors.dart';

class SelectLanguage extends StatelessWidget {
  static const id = 'SelectLanguage';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: gouudBackgroundColor,
        body: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment
                  .spaceEvenly, //Center Column contents vertically,
              crossAxisAlignment: CrossAxisAlignment.center,

              children: <Widget>[
                Column(children: <Widget>[
                  new Row(
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
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Column(
                        children: <Widget>[
                          Text('CHOOSE LANGUAGE',
                              style: TextStyle(
                                  fontSize: 20, color: gouudBlackFontColor)),
                          Text('CREATE AN ACCOUNT TO FUTURE',
                              style: TextStyle(
                                  fontSize: 12, color: Colors.black26))
                        ],
                      ),
                    ],
                  ),
                ]),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    languageButton('عربى', context, 'SignUp'),
                  ],
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    languageButton('English', context, 'SignUp'),
                  ],
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Container(child: Text('')),
                  ],
                ),
              ],
            ),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/icons/screen-background.png'),
                    fit: BoxFit.cover))));
  }

  /// button widget
  Widget languageButton(label, context, page) {
    return new Container(
      // padding: EdgeInsets.only(top: 60),
      child: ButtonTheme(
        minWidth: 200,
        height: 60,
        child: RaisedButton(
          color: gouudAppColor,
          onPressed: () => {Navigator.pushReplacementNamed(context, page)},
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0),
          ),
          child: Text(label.toString(),
              style: TextStyle(fontSize: 20, color: gouudWhite)),
        ),
      ),
      decoration: BoxDecoration(
          borderRadius: new BorderRadius.circular(30.0),
          border: Border.all(color: Colors.white)),
    );
  }
}
