import 'package:flutter/material.dart';
import 'package:gouud/UI_EN/constants/BarContent.dart';
import 'package:gouud/UI_EN/constants/gouudColors.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class Favourite extends StatefulWidget {
  static const id = 'Favourite';
  @override
  _FavouriteState createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

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
        backgroundColor: Colors.black,
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
                new Center(
                  child: new Text(
                    "My Favourits",
                    style: TextStyle(color: gouudAppColor, fontSize: 18),
                  ),
                ),
                new Container(
                  child: GridView.count(
                    controller: new ScrollController(keepScrollOffset: false),
                    shrinkWrap: true,
                    // scrollDirection: Axis.vertical,
                    crossAxisCount: 2,
                    childAspectRatio: .7,
                    padding:
                        EdgeInsets.only(bottom: 45, left: 0, right: 0, top: 10),
                    mainAxisSpacing: 10,
                    children: List.generate(20, (index) {
                      return ProductCard();
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

class ProductCard extends StatefulWidget {
  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  var rating = 3.0;
  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(26)),
        child: GestureDetector(
            onTap: () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (BuildContext context) => Product()));
            },
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    flex: 6,
                    child: Container(
                      decoration: new BoxDecoration(
                        color: gouudWhite,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25.0),
                            topRight: Radius.circular(25.0)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  width: 60,
                                  height: 25,
                                  child: Center(
                                      child: Text(
                                    '-35%',
                                    style: TextStyle(color: gouudWhite),
                                    textAlign: TextAlign.center,
                                  )),
                                  decoration: new BoxDecoration(
                                    color: gouudBackgroundColor,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(25.0),
                                        bottomRight: Radius.circular(25.0)),
                                  ),
                                ),
                                Padding(
                                    padding: EdgeInsets.only(right: 10, top: 5),
                                    child: Icon(
                                      Icons.favorite,
                                      color: gouudAppColor,
                                      size: 30,
                                    ))
                              ]),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(2),
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15.0),
                                    topRight: Radius.circular(15.0)),
                                child: Image(
                                    image:
                                        AssetImage('assets/icons/bottle1.png'),
                                    fit: BoxFit.contain),
                              ),
                            ),
                          ),
                          Center(
                              child: SmoothStarRating(
                            rating: rating,
                            isReadOnly: false,
                            size: 20,
                            color: gouudAppColor,
                            borderColor: gouudAppColor,
                            filledIconData: Icons.star,
                            halfFilledIconData: Icons.star_half,
                            defaultIconData: Icons.star_border,
                            starCount: 5,
                            allowHalfRating: true,
                            spacing: 2.0,
                            onRated: (value) {
                              // print("rating value -> $value");
                              // print("rating value dd -> ${value.truncate()}");
                            },
                          )),
                          Center(
                            child: Text(
                              'AQUA WATER 5 L',
                              style: TextStyle(fontSize: 10),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text(
                                '15 SAR',
                                style: TextStyle(
                                    fontSize: 15, color: gouudAppColor),
                              ),
                              Container(
                                width: 60,
                                height: 20,
                                child: Center(
                                    child: Text(
                                  'PARTS',
                                  style: TextStyle(
                                      fontSize: 8, color: gouudAppColor),
                                )),
                                decoration: new BoxDecoration(
                                  color: gouudWhite,
                                  boxShadow: [
                                    BoxShadow(
                                        color: gouudAppColor, spreadRadius: 1)
                                  ],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                      child: Container(
                          decoration: new BoxDecoration(
                            color: gouudAppColor,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(25.0),
                              bottomRight: Radius.circular(25.0),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Icon(
                                Icons.shopping_cart,
                                color: gouudWhite,
                              ),
                              Text(
                                "ADD TO CART",
                                style:
                                    TextStyle(color: gouudWhite, fontSize: 10),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          )))
                ],
              ),
            )));
  }
}
