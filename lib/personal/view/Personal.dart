import 'package:flutter/material.dart';
import 'package:gouud/UI_EN/constants/gouudColors.dart';
import 'package:gouud/UI_EN/constants/BarContent.dart';

class Personal extends StatefulWidget {
  static const id = 'Personal';
  @override
  _PersonalState createState() => _PersonalState();
}

class _PersonalState extends State<Personal> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  String page;
  @override
  void initState() {
    super.initState();
    page = Personal.id;
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
          ListView(children: <Widget>[
            new Padding(
              padding: new EdgeInsets.all(10.0),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                      child: CircleAvatar(
                    backgroundColor: gouudBackgroundColor,
                    radius: 50,
                    backgroundImage: AssetImage('assets/icons/user.png'),
                  )),
                ],
              ),
            ),
            new CardItemSection(),
          ]),
        ]),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
        child: ButtonTheme(
          height: 60,
          child: RaisedButton(
            onPressed: () {},
            color: gouudAppColor,
            textColor: gouudWhite,
            child: GestureDetector(
              onTap: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (BuildContext context) => PayNow()));
              },
              child: Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Data modifiy',
                      style: TextStyle(color: gouudWhite, fontSize: 12),
                    ),
                    Text(
                      'Chang password',
                      style: TextStyle(color: gouudWhite, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget bar() {
    return PreferredSize(
        preferredSize: const Size(double.infinity, 250),
        child: UpperBar(_scaffoldKey));
  }
}

class CardItemSection extends StatefulWidget {
  @override
  _CardItemSectionState createState() => _CardItemSectionState();
}

class _CardItemSectionState extends State<CardItemSection> {
  var rating = 3.0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Card(
        color: gouudAppColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: gouudWhite, width: .5),
        ),
        borderOnForeground: true,
        child: Column(
          children: <Widget>[
            Container(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(5),
                              child: Icon(
                                Icons.edit,
                                size: 20,
                                color: gouudWhite,
                              ),
                            ),
                            Text(
                              'Order Number',
                              style: TextStyle(fontSize: 12, color: gouudWhite),
                            ),
                          ],
                        ),
                        Text('#123456',
                            style: TextStyle(fontSize: 12, color: gouudWhite)),
                      ]),
                ),
                decoration: new BoxDecoration(
                  border: Border(
                    top: BorderSide(color: gouudWhite, width: .5),
                  ),
                )),
            Container(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(5),
                              child: Icon(
                                Icons.edit,
                                size: 20,
                                color: gouudWhite,
                              ),
                            ),
                            Text(
                              'Order Number',
                              style: TextStyle(fontSize: 12, color: gouudWhite),
                            ),
                          ],
                        ),
                        Text('#123456',
                            style: TextStyle(fontSize: 12, color: gouudWhite)),
                      ]),
                ),
                decoration: new BoxDecoration(
                  border: Border(
                    top: BorderSide(color: gouudWhite, width: .5),
                  ),
                )),
            Container(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(5),
                              child: Icon(
                                Icons.edit,
                                size: 20,
                                color: gouudWhite,
                              ),
                            ),
                            Text(
                              'Order Number',
                              style: TextStyle(fontSize: 12, color: gouudWhite),
                            ),
                          ],
                        ),
                        Text('#123456',
                            style: TextStyle(fontSize: 12, color: gouudWhite)),
                      ]),
                ),
                decoration: new BoxDecoration(
                  border: Border(
                    top: BorderSide(color: gouudWhite, width: .5),
                  ),
                )),
            Container(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(5),
                              child: Icon(
                                Icons.edit,
                                size: 20,
                                color: gouudWhite,
                              ),
                            ),
                            Text(
                              'Order Number',
                              style: TextStyle(fontSize: 12, color: gouudWhite),
                            ),
                          ],
                        ),
                        Text('#123456',
                            style: TextStyle(fontSize: 12, color: gouudWhite)),
                      ]),
                ),
                decoration: new BoxDecoration(
                  border: Border(
                    top: BorderSide(color: gouudWhite, width: .5),
                  ),
                )),
            Container(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(5),
                              child: Icon(
                                Icons.edit,
                                size: 20,
                                color: gouudWhite,
                              ),
                            ),
                            Text(
                              'Order Number',
                              style: TextStyle(fontSize: 12, color: gouudWhite),
                            ),
                          ],
                        ),
                        Text('#123456',
                            style: TextStyle(fontSize: 12, color: gouudWhite)),
                      ]),
                ),
                decoration: new BoxDecoration(
                  border: Border(
                    top: BorderSide(color: gouudWhite, width: .5),
                  ),
                )),
          ],
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
