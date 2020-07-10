import 'package:flutter/material.dart';
import 'package:flutter_image/network.dart';
import 'package:gouud/UI_EN/constants/BarContent.dart';
import 'package:gouud/UI_EN/constants/gouudColors.dart';
import 'package:gouud/sectionProducts/view/SectionProducts.dart';
import 'package:gouud/sections/model/SectionsModel.dart';
import 'package:gouud/sections/provider/SectionsProvider.dart';
import 'package:gouud/specialOffers/view/SpecialOffers.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

///image mapping
final List<String> imageList = [
  'assets/icons/bottle1.png',
  'assets/icons/bottle2.png',
  'assets/icons/bottle3.png',
];
int current = 0;

class Sections extends StatefulWidget {
  static const id = 'Sections';
  @override
  _SectionsState createState() => _SectionsState();
}

class _SectionsState extends State<Sections> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  SectionsModel section;
  Future<List<SectionsModel>> sections;
  List<List> cardData = [
    ['erwaa-٢٣.png', 'MOSQUE OFFER'],
    ['erwaa-٢٤.png', 'COMPANY OFFER'],
  ];

  @override
  void initState() {
    super.initState();
    sections = SectionsProvider().sectionsData();
    print(sections);
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
                      image:
                          new AssetImage("assets/icons/screen-background.png"),
                      fit: BoxFit.cover)),
            ),
            ListView(children: <Widget>[
              FutureBuilder<List<SectionsModel>>(
                  future: sections,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data.length > 0) {
                        return Container(
                          child: GridView.count(
                            controller:
                                new ScrollController(keepScrollOffset: false),
                            shrinkWrap: true,
                            // scrollDirection: Axis.vertical,
                            crossAxisCount: 1,
                            childAspectRatio: 3,
                            padding: EdgeInsets.only(
                                bottom: 10, left: 15, right: 15, top: 10),
                            mainAxisSpacing: 10,
                            children:
                                List.generate(snapshot.data.length, (index) {
                              return CardItemSection(
                                  snapshot.data[index].name,
                                  snapshot.data[index].photoUrl,
                                  snapshot.data[index].navigationUrl);
                            }),
                          ),
                        );
                      } else {
                        return Center(
                            child: Text(
                          'No Sections yet ...',
                          style: TextStyle(color: Colors.white),
                        ));
                      }
                    }
                    return Container(
                      height: 200,
                      child: Center(
                        child: CircularProgressIndicator(
                          backgroundColor: gouudBackgroundColor,
                        ),
                      ),
                    );
                  }),
              NarrowCard(),
              new Container(
                child: GridView.count(
                  controller: new ScrollController(keepScrollOffset: false),
                  shrinkWrap: true,
                  // scrollDirection: Axis.vertical,
                  crossAxisCount: 2,
                  childAspectRatio: 1.2,
                  padding:
                      EdgeInsets.only(bottom: 10, left: 10, right: 10, top: 10),
                  mainAxisSpacing: 10,
                  children: List.generate(2, (index) {
                    return SpecialOfferCard(
                        cardData[index][0], cardData[index][1]);
                  }),
                ),
              ),
              Padding(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[],
                  ))
            ])
          ])),
    );
  }

  Widget bar() {
    return PreferredSize(
        preferredSize: const Size(double.infinity, 70),
        child: UpperBar(_scaffoldKey));
  }
}

class CircleIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double size = 20.0;

    return new Container(
      width: size,
      height: size,
      decoration: new BoxDecoration(
        color: gouudAppColor,
        shape: BoxShape.circle,
        boxShadow: [BoxShadow(color: gouudWhite, spreadRadius: 1)],
      ),
      child: Text(
        '2',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: gouudWhite,
        ),
      ),
    );
  }
}

class CardItemSection extends StatefulWidget {
  final String name;
  final String photoUrl;
  final String navigationUrl;
  CardItemSection(this.name, this.photoUrl, this.navigationUrl);
  @override
  _CardItemSectionState createState() => _CardItemSectionState();
}

class _CardItemSectionState extends State<CardItemSection> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Row(
                children: <Widget>[
                  new Padding(
                    padding: EdgeInsets.only(left: 20, right: 5),
                    child: new Container(
                      width: 50,
                      height: 60,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: new NetworkImageWithRetry(widget.photoUrl),
                              fit: BoxFit.cover)),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      GestureDetector(
                        child: Text(
                          widget.name,
                          style: TextStyle(color: gouudWhite, fontSize: 18),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      SectionProducts(widget.navigationUrl)));
                        },
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        SectionProducts(widget.navigationUrl)));
                          },
                          child: Text(
                            'this water is very good',
                            style:
                                TextStyle(color: gouudFontColor, fontSize: 12),
                          ))
                    ],
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              SectionProducts(widget.navigationUrl)));
                },
                child: Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: gouudFontColor,
                    size: 20,
                  ),
                ),
              )
            ],
          ),
          decoration: new BoxDecoration(
            color: gouudAppColor,
            boxShadow: [BoxShadow(color: gouudGrey, spreadRadius: 1)],
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
          ),
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

class SpecialOfferCard extends StatefulWidget {
  final String image;
  final String text;
  SpecialOfferCard(this.image, this.text);
  @override
  _SpecialOfferCardState createState() => _SpecialOfferCardState();
}

class _SpecialOfferCardState extends State<SpecialOfferCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(10),
        child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => SpecialOffers()));
            },
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: Container(
                              decoration: new BoxDecoration(
                                  image: new DecorationImage(
                                      image: new AssetImage(
                                          "assets/icons/" + widget.image),
                                      fit: BoxFit.fill)),
                            ),
                          ),
                        ),
                        Expanded(
                            child: Padding(
                          padding:
                              EdgeInsets.only(top: 10, bottom: 30, right: 10),
                          child: offer(),
                        ))
                      ],
                    ),
                  ),
                  Expanded(
                      flex: 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                widget.text,
                                style:
                                    TextStyle(color: gouudWhite, fontSize: 10),
                              ),
                              Text(
                                'Touch pointer move a lot',
                                style: TextStyle(
                                    color: gouudFontColor, fontSize: 8),
                              )
                            ],
                          ),
                          Icon(
                            Icons.favorite,
                            color: gouudWhite,
                          )
                        ],
                      ))
                ],
              ),
              decoration: new BoxDecoration(
                color: gouudAppColor,
                boxShadow: [BoxShadow(color: gouudGrey, spreadRadius: 1)],
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
              ),
            )));
  }

  /// button widget
  Widget offer() {
    return new Container(
      height: 25,
      child: Center(
        child: Text(
          "OFFER TO 10%",
          style: TextStyle(fontSize: 6, color: gouudFontColor),
          textAlign: TextAlign.center,
        ),
      ),
      decoration: BoxDecoration(
          borderRadius: new BorderRadius.circular(30.0),
          border: Border.all(color: gouudWhite)),
    );
  }
}

class NarrowCard extends StatefulWidget {
  @override
  _NarrowCardState createState() => _NarrowCardState();
}

class _NarrowCardState extends State<NarrowCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Container(
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    GestureDetector(
                      child: Text(
                        'SPECIAL OFFER',
                        style: TextStyle(color: gouudWhite, fontSize: 10),
                      ),
                      onTap: () {},
                    ),
                    GestureDetector(
                        onTap: () {},
                        child: Text(
                          'this water is very good',
                          style: TextStyle(color: gouudFontColor, fontSize: 8),
                        ))
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.all(5), child: narrowContainer()),
            ],
          ),
          decoration: new BoxDecoration(
            color: gouudAppColor,
            boxShadow: [BoxShadow(color: gouudGrey, spreadRadius: 1)],
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
          ),
        ));
  }

  /// button widget
  Widget narrowContainer() {
    return new Container(
      width: 150,
      height: 30,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text(
            "MOSQUES",
            style: TextStyle(fontSize: 10, color: gouudFontColor),
          ),
          Text(
            "COMPANY",
            style: TextStyle(fontSize: 10, color: gouudFontColor),
          ),
        ],
      ),
      decoration: BoxDecoration(
          borderRadius: new BorderRadius.circular(30.0),
          border: Border.all(color: gouudWhite)),
    );
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
                                      Icons.favorite_border,
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

class NarrowCardViewAll extends StatefulWidget {
  final void Function() navigate;

  final String text;
  NarrowCardViewAll(this.text, this.navigate);

  @override
  _NarrowCardViewAllState createState() => _NarrowCardViewAllState();
}

class _NarrowCardViewAllState extends State<NarrowCardViewAll> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          // Navigator.push(context,
          //     MaterialPageRoute(builder: (BuildContext context) => Products()));
        },
        child: Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Container(
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        GestureDetector(
                          child: Text(
                            widget.text,
                            style: TextStyle(color: gouudWhite, fontSize: 10),
                          ),
                          onTap: () {},
                        ),
                        GestureDetector(
                            onTap: () {},
                            child: Text(
                              'this water is very good',
                              style:
                                  TextStyle(color: gouudFontColor, fontSize: 8),
                            ))
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(5), child: narrowContainer()),
                ],
              ),
              decoration: new BoxDecoration(
                color: gouudAppColor,
                boxShadow: [BoxShadow(color: gouudGrey, spreadRadius: 1)],
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
              ),
            )));
  }

  /// button widget
  Widget narrowContainer() {
    return new Container(
      width: 75,
      height: 30,
      child: Center(
        child: Text(
          "VIEW ALL",
          style: TextStyle(fontSize: 10, color: gouudFontColor),
        ),
      ),
      decoration: BoxDecoration(
          borderRadius: new BorderRadius.circular(30.0),
          border: Border.all(color: gouudWhite)),
    );
  }
}

class ScrolProducts extends StatefulWidget {
  final void Function() navigate;
  ScrolProducts(this.navigate);
  @override
  _ScrolProductsState createState() => _ScrolProductsState();
}

class _ScrolProductsState extends State<ScrolProducts> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
            child: Column(
          children: <Widget>[
            NarrowCardViewAll('AQUA PRODUCTS', widget.navigate),
            Expanded(
                child: new Container(
              margin: EdgeInsets.only(top: 20, bottom: 0),
              height: 300,
              child: GridView.count(
                // controller: new ScrollController(keepScrollOffset: false),
                // shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                crossAxisCount: 1,
                childAspectRatio: 1.5,
                padding: EdgeInsets.only(bottom: 10, left: 5, right: 5),
                children: List.generate(10, (index) {
                  return ProductCard();
                }),
              ),
            ))
          ],
        ))
      ],
    );
  }
}
