import 'package:flutter/material.dart';
import 'package:gouud/UI_EN/constants/gouudColors.dart';
import 'package:gouud/UI_EN/constants/BarContent.dart';

class AboutApp extends StatefulWidget {
  static const id = 'AboutApp';
  @override
  _AboutAppState createState() => _AboutAppState();
}

class _AboutAppState extends State<AboutApp> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  var rating = 3.0;

  String page;
  @override
  void initState() {
    super.initState();
    page = AboutApp.id;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: bar(),
      key: _scaffoldKey,
      backgroundColor: gouudBackgroundColor,
      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: Stack(children: <Widget>[
          new Container(
            decoration: new BoxDecoration(
                image: new DecorationImage(
                    image: new AssetImage("assets/icons/screen-background.png"),
                    fit: BoxFit.cover)),
          ),
          ListView(
              padding:
                  EdgeInsets.only(bottom: 70, left: 20, right: 20, top: 100),
              children: <Widget>[
                new Container(
                  padding: EdgeInsets.only(top: 200),
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage('assets/icons/logo-screen.png'),
                  )),
                ),
                new CardPersonal()
              ]),
        ]),
      ),
    );
  }

  Widget bar() {
    return PreferredSize(
        preferredSize: const Size(double.infinity, 250),
        child: UpperBar(_scaffoldKey));
  }
}

class CardPersonal extends StatefulWidget {
  @override
  _CardPersonalState createState() => _CardPersonalState();
}

class _CardPersonalState extends State<CardPersonal> {
  var rating = 3.0;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: gouudAppColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: gouudWhite, width: .5),
      ),
      borderOnForeground: true,
      child: Column(
        children: <Widget>[
          new Container(
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Column(children: <Widget>[
                Text(
                  'Gouud, new business ideas with talent mobile apps are doing better ',
                  style: TextStyle(fontSize: 12, color: gouudWhite),
                ),
              ]),
            ),
            decoration: new BoxDecoration(
              border: Border(
                top: BorderSide(color: gouudWhite, width: .5),
              ),
            ),
          ),
          new Container(
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Column(children: <Widget>[
                Text(
                  'By almost every metric, new business ideas with talent mobile apps are doing better in the market (formerly known as Mobile)',
                  style: TextStyle(fontSize: 12, color: gouudWhite),
                ),
              ]),
            ),
            decoration: new BoxDecoration(
              border: Border(
                top: BorderSide(color: gouudWhite, width: .5),
              ),
            ),
          ),
          new Container(
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Column(children: <Widget>[
                Text(
                  'New business ideas with talent mobile apps are doing better in the market (formerly known as Mobile)By almost every metric, new business ideas with talent mobile apps are doing better in the market (formerly known as Mobile)',
                  style: TextStyle(fontSize: 12, color: gouudWhite),
                ),
              ]),
            ),
            decoration: new BoxDecoration(
              border: Border(
                top: BorderSide(color: gouudWhite, width: .5),
              ),
            ),
          ),
        ],
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
