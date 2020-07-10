import 'package:flutter/material.dart';
import 'package:gouud/UI_EN/constants/BarContent.dart';
import 'package:gouud/UI_EN/constants/gouudColors.dart';

class SpecialOffers extends StatefulWidget {
  static const id = 'SpecialOffers';

  @override
  _SpecialOffersState createState() => _SpecialOffersState();
}

class _SpecialOffersState extends State<SpecialOffers> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  List<List> cardData = [
    ['erwaa-٢٣.png', 'MOSQUE OFFER'],
    ['erwaa-٢٤.png', 'COMPANY OFFER'],
  ];
  viewNavigate() {
    // Navigator.push(context,
    //     MaterialPageRoute(builder: (BuildContext context) => Products()));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        extendBodyBehindAppBar: true,
        appBar: bar(),
        key: _scaffoldKey,
        drawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              ListTile(
                leading: Image(
                  height: 200,
                  width: 200,
                  image: AssetImage('assets/icons/logo.png'),
                ),
                title: Text(''),
                onTap: () {},
              ),
              ListTile(
                title: Text('select 1'),
                onTap: () {},
              ),
              ListTile(
                title: Text('select 2'),
                onTap: () {},
              ),
              ListTile(
                title: Text('select 3'),
                onTap: () {},
              ),
              ListTile(
                title: Text('select 4'),
                onTap: () {},
              ),
              ListTile(
                title: Text('select 5'),
                onTap: () {},
              ),
            ],
          ),
        ),
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
                Center(
                  child: Text(
                    'Special Offers',
                    style: TextStyle(color: gouudAppColor),
                  ),
                ),
                new Container(
                  child: GridView.count(
                    controller: new ScrollController(keepScrollOffset: false),
                    shrinkWrap: true,
                    // scrollDirection: Axis.vertical,
                    crossAxisCount: 2,
                    childAspectRatio: 1.1,
                    padding: EdgeInsets.only(
                        bottom: 55, left: 15, right: 15, top: 20),
                    mainAxisSpacing: 10,
                    children: List.generate(20, (index) {
                      return DailyDealsCard();
                    }),
                  ),
                ),
              ]),
            ])));
  }

  Widget bar() {
    return PreferredSize(
        preferredSize: const Size(double.infinity, 70),
        child: UpperBar(_scaffoldKey));
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

class DailyDealsCard extends StatefulWidget {
  @override
  _DailyDealsCardState createState() => _DailyDealsCardState();
}

class _DailyDealsCardState extends State<DailyDealsCard> {
  var rating = 3.0;
  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(26)),
        child: GestureDetector(
            onTap: () {},
            child: Container(
              decoration: new BoxDecoration(
                color: gouudAppColor,
                boxShadow: [BoxShadow(color: gouudWhite, spreadRadius: .5)],
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                      flex: 2,
                      child: Container(
                          decoration: new BoxDecoration(
                            color: gouudBackgroundColor,
                            boxShadow: [
                              BoxShadow(color: gouudAppColor, spreadRadius: 1)
                            ],
                            borderRadius:
                                BorderRadius.all(Radius.circular(25.0)),
                          ),
                          child: Stack(children: <Widget>[
                            new Container(
                              decoration: new BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25.0)),
                                  image: new DecorationImage(
                                      image: new AssetImage(
                                          "assets/icons/erwaa-٥٠.png"),
                                      fit: BoxFit.fill)),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Padding(
                                        padding: EdgeInsets.only(
                                            bottom: 5, right: 10),
                                        child: narrowContainer("OFFER TO 20%"))
                                  ],
                                )
                              ],
                            )
                          ]))),
                  Expanded(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(
                              "AQUA WATER 1.5L",
                              style: TextStyle(fontSize: 10, color: gouudWhite),
                            ),
                            smallContainer("WATER")
                          ],
                        ),
                        Text(
                          '250 LE',
                          style: TextStyle(
                              fontSize: 12, color: gouudBackgroundColor),
                        )
                      ]))
                ],
              ),
            )));
  }

  Widget narrowContainer(text) {
    return new Container(
      width: 75,
      height: 20,
      child: Center(
        child: Text(
          text,
          style: TextStyle(fontSize: 8, color: gouudAppColor),
        ),
      ),
      decoration: BoxDecoration(
          borderRadius: new BorderRadius.circular(30.0),
          border: Border.all(color: gouudAppColor)),
    );
  }

  Widget smallContainer(text) {
    return new Container(
      width: 75,
      height: 20,
      child: Center(
        child: Text(
          text,
          style: TextStyle(fontSize: 8, color: gouudWhite),
        ),
      ),
      decoration: BoxDecoration(
          borderRadius: new BorderRadius.circular(30.0),
          border: Border.all(color: gouudWhite)),
    );
  }
}
