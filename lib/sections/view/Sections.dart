import 'package:flutter/material.dart';
import 'package:flutter_image/network.dart';
import 'package:gouud/UI_EN/constants/BarContent.dart';
import 'package:gouud/UI_EN/constants/gouudColors.dart';
import 'package:gouud/sectionProducts/view/SectionProducts.dart';
import 'package:gouud/sections/model/SectionsModel.dart';
import 'package:gouud/sections/provider/SectionsProvider.dart';
import 'package:gouud/specialOffers/view/SpecialOffers.dart';

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
