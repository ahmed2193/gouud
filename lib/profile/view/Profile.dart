import 'package:flutter/material.dart';
import 'package:gouud/UI_EN/constants/gouudColors.dart';
import 'package:gouud/UI_EN/constants/BarContent.dart';

class Profile extends StatefulWidget {
  static const id = 'Profile';
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  var rating = 3.0;
  List<String> textData = [
    'MY PERSONAL',
    'MY FAVOURITE',
    'MY CART',
    'MY REQUEST',
    'ABOUT APP',
    'CALL US',
    'MY SETTING',
    'LOG OUT'
  ];
  List<String> imagesData = [
    'personal.png',
    'fav.png',
    'cart.png',
    'request.png',
    'about.png',
    'call.png',
    'setting.png',
    'log.png'
  ];
  List<String> navigations = [
    'Personal',
    'Favourite',
    'Cart',
    'Orders',
    'AboutApp',
    'Call',
    'Setting',
    'Logout'
  ];
  String page;
  @override
  void initState() {
    super.initState();
    page = Profile.id;
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
            new Container(
                child: Column(
              children: <Widget>[
                Text(
                  'Hi !',
                  style: TextStyle(fontSize: 14, color: gouudAppColor),
                ),
                Text(
                  'ABDELWAHED SAEED',
                  style: TextStyle(fontSize: 10, color: gouudAppColor),
                ),
                CircleAvatar(
                  backgroundColor: gouudBackgroundColor,
                  radius: 50,
                  backgroundImage: AssetImage('assets/icons/user.png'),
                )
              ],
            )),
            new Container(
              child: GridView.count(
                // padding: EdgeInsets.all(10),
                controller: new ScrollController(keepScrollOffset: false),
                shrinkWrap: true,
                crossAxisCount: 2,
                childAspectRatio: 1.2,
                padding:
                    EdgeInsets.only(bottom: 15, left: 50, right: 50, top: 15),
                children: List.generate(8, (index) {
                  return CardItem(
                      imagesData[index], textData[index], navigations[index]);
                }),
              ),
            ),
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

class CardItem extends StatefulWidget {
  final String image;
  final String text;
  final String navigate;
  CardItem(this.image, this.text, this.navigate);
  @override
  _CardItemState createState() => _CardItemState();
}

class _CardItemState extends State<CardItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, widget.navigate);
      },
      child: Card(
        elevation: 0,
        color: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 5,
              child: Container(
                  margin: EdgeInsets.all(10),
                  decoration: new BoxDecoration(
                    color: gouudAppColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Image(
                      image: AssetImage('assets/icons/profile/' + widget.image),
                    ),
                  )),
            ),
            Expanded(
                flex: 1,
                child: Center(
                  child: Text(
                    widget.text,
                    style: TextStyle(color: gouudAppColor, fontSize: 10),
                  ),
                ))
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
