import 'package:carousel_slider/carousel_options.dart';
import 'package:flutter/material.dart';
import 'package:gouud/UI_EN/constants/BarContent.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:gouud/UI_EN/constants/gouudColors.dart';
import 'package:gouud/product/view/Product.dart';
import 'package:gouud/products/view/Products.dart';
import 'package:gouud/sectionProducts/model/BestSellerModel.dart';
import 'package:gouud/sectionProducts/model/SectionProductsModel.dart';
import 'package:gouud/sectionProducts/provider/BestSellerProvider.dart';
import 'package:gouud/sectionProducts/provider/SectionProductsProvider.dart';
import 'package:gouud/specialOffers/view/SpecialOffers.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:flutter_image/network.dart';

final List<String> imageList = [
  "assets/icons/slide2.png",
  "assets/icons/slide3.png",
];

int _current = 0;
final List<Widget> imageSliders = imageList
    .map((item) => Container(
          child: Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    Image.asset(item, fit: BoxFit.cover, width: 1000.0),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ))
    .toList();

class SectionProducts extends StatefulWidget {
  static const id = 'SectionProducts';
  final String departmentId;
  SectionProducts(this.departmentId);
  @override
  _SectionProductsState createState() => _SectionProductsState();
}

class _SectionProductsState extends State<SectionProducts> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  List<List> cardData = [
    ['erwaa-٢٣.png', 'MOSQUE OFFER'],
    ['erwaa-٢٤.png', 'COMPANY OFFER'],
  ];

  Future<BestSellerModel> bestSeller;
  Future<SectionProductsModel> sectionProducts;
  @override
  void initState() {
    super.initState();
    bestSeller = BestSellerProvider().bestSellerData();
    sectionProducts =
        SectionProductsProvider().sectionProductsData(widget.departmentId);
    print(sectionProducts);
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
                CarouselSlider(
                  items: imageSliders,
                  options: CarouselOptions(
                      autoPlay: true,
                      enlargeCenterPage: true,
                      aspectRatio: 3.0,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      }),
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: imageList.map((url) {
                    int index = imageList.indexOf(url);
                    return Container(
                      width: 8.0,
                      height: 8.0,
                      margin:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _current == index
                            ? gouudAppColor
                            : gouudBackgroundColor,
                      ),
                    );
                  }).toList(),
                ),
                NarrowCardViewAllOther('BEST SELLER', 'BestSeller'),
                new Container(
                  margin: EdgeInsets.only(top: 20, bottom: 0),
                  height: 300,
                  child: FutureBuilder<BestSellerModel>(
                      future: bestSeller,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          if (snapshot.data.data.length > 0) {
                            return GridView.count(
                              // controller: new ScrollController(keepScrollOffset: false),
                              // shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              crossAxisCount: 1,
                              childAspectRatio: 1.7,
                              padding: EdgeInsets.only(
                                  bottom: 10, left: 5, right: 5),
                              children: List.generate(snapshot.data.data.length,
                                  (index) {
                                return ProductCard(
                                    snapshot.data.data[index].nameEn,
                                    snapshot.data.data[index].brand.department
                                        .nameEn,
                                    snapshot.data.data[index].price,
                                    snapshot.data.data[index].rate,
                                    snapshot.data.data[index].images[0].image,
                                    snapshot.data.data[index].id.toString());
                              }),
                            );
                          } else {
                            return Center(
                                child: Text(
                              'No Sections yet ...',
                              style: TextStyle(color: Colors.white),
                            ));
                          }
                        }
                        return Center(
                            child: CircularProgressIndicator(
                          backgroundColor: gouudBackgroundColor,
                        ));
                      }),
                ),
                NarrowCardViewAllOther('DAILY DEALS', ''),
                new Container(
                  child: GridView.count(
                    controller: new ScrollController(keepScrollOffset: false),
                    shrinkWrap: true,
                    // scrollDirection: Axis.vertical,
                    crossAxisCount: 2,
                    childAspectRatio: 1.1,
                    padding: EdgeInsets.only(
                        bottom: 30, left: 15, right: 15, top: 20),
                    mainAxisSpacing: 10,
                    children: List.generate(4, (index) {
                      return DailyDealsCard();
                    }),
                  ),
                ),
                new Container(
                  child: FutureBuilder<SectionProductsModel>(
                      future: sectionProducts,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          if (snapshot.data.data.length > 0) {
                            return GridView.count(
                              controller:
                                  new ScrollController(keepScrollOffset: false),
                              shrinkWrap: true,
                              // scrollDirection: Axis.vertical,
                              crossAxisCount: 1,
                              childAspectRatio: 1,
                              padding: EdgeInsets.only(
                                  bottom: 20, left: 0, right: 0, top: 10),
                              // mainAxisSpacing: 10,
                              children: List.generate(snapshot.data.data.length,
                                  (index) {
                                return ScrolProducts(
                                    snapshot.data.data[index].nameEn,
                                    snapshot.data.data[index].id.toString(),
                                    snapshot.data.data[index].department.nameEn,
                                    snapshot.data.data[index].product);
                              }),
                            );
                          } else {
                            /////
                            return Center(
                                child: Text(
                              'No Sections yet ...',
                              style: TextStyle(color: Colors.white),
                            ));
                          }
                        }
                        return Center(
                            child: CircularProgressIndicator(
                          backgroundColor: gouudBackgroundColor,
                        ));
                      }),
                ),
                NarrowCard(),
                new Container(
                  child: GridView.count(
                    controller: new ScrollController(keepScrollOffset: false),
                    shrinkWrap: true,
                    // scrollDirection: Axis.vertical,
                    crossAxisCount: 2,
                    childAspectRatio: 1.2,
                    padding: EdgeInsets.only(
                        bottom: 45, left: 10, right: 10, top: 10),
                    mainAxisSpacing: 10,
                    children: List.generate(2, (index) {
                      return SpecialOfferCard(
                          cardData[index][0], cardData[index][1]);
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

class ProductCard extends StatefulWidget {
  final String productName;
  final String departmentName;
  final String price;
  final double rate;
  final String photoUrl;
  final String navigationUrl;
  ProductCard(this.productName, this.departmentName, this.price, this.rate,
      this.photoUrl, this.navigationUrl);
  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(26)),
        child: GestureDetector(
            onTap: () {
              pushNewScreen(context,
                  screen: Product(widget.navigationUrl),
                  platformSpecific: true,
                  withNavBar: false);
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
                        boxShadow: [
                          BoxShadow(color: gouudAppColor, spreadRadius: 1)
                        ],
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25.0),
                            topRight: Radius.circular(25.0)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                            flex: 3,
                            child: Padding(
                              padding: EdgeInsets.all(2),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15.0),
                                      topRight: Radius.circular(15.0)),
                                  child: new Image(
                                    image: new NetworkImageWithRetry(
                                        widget.photoUrl),
                                  )),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Center(
                                    child: SmoothStarRating(
                                  rating: widget.rate,
                                  isReadOnly: true,
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
                                    widget.productName,
                                    style: TextStyle(fontSize: 8),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Text(
                                      widget.price,
                                      style: TextStyle(
                                          fontSize: 8, color: gouudAppColor),
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
                                              color: gouudAppColor,
                                              spreadRadius: 1)
                                        ],
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0)),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                      child: Container(
                          decoration: new BoxDecoration(
                            color: gouudAppColor,
                            boxShadow: [
                              BoxShadow(color: gouudAppColor, spreadRadius: 1)
                            ],
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

class ScrolProducts extends StatefulWidget {
  final String brandName;
  final String viewAllUrl;
  final String department;
  final List<ProductsData> productsCards;
  ScrolProducts(
      this.brandName, this.viewAllUrl, this.department, this.productsCards);
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: NarrowCardViewAll(
                  widget.brandName + ' PRODUCTS', widget.viewAllUrl),
            ),
            // Container(
            //   height: 20,
            // ),
            Expanded(
                child: new Container(
              // margin: EdgeInsets.only(top: 20, bottom: 0),
              height: 320,
              child: GridView.count(
                // controller: new ScrollController(keepScrollOffset: false),
                // shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                crossAxisCount: 1,
                childAspectRatio: 1.6,
                padding: EdgeInsets.only(bottom: 10, left: 5, right: 5),
                children: List.generate(widget.productsCards.length, (index) {
                  return ProductCard(
                      widget.productsCards[index].nameEn,
                      widget.department,
                      widget.productsCards[index].price,
                      widget.productsCards[index].rate,
                      widget.productsCards[index].images[0].image,
                      widget.productsCards[index].id.toString());
                }),
              ),
            ))
          ],
        ))
      ],
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
        padding: EdgeInsets.only(left: 20, right: 20, top: 0),
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

class NarrowCardViewAll extends StatefulWidget {
  final String text;
  final String navigate;
  NarrowCardViewAll(this.text, this.navigate);

  @override
  _NarrowCardViewAllState createState() => _NarrowCardViewAllState();
}

class _NarrowCardViewAllState extends State<NarrowCardViewAll> {
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
                        widget.text,
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
              Padding(
                  padding: EdgeInsets.all(5),
                  child: narrowContainer(widget.navigate)),
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
  Widget narrowContainer(pageName) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => Products(widget.navigate)));
      },
      child: new Container(
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
      ),
    );
  }
}

class NarrowCardViewAllOther extends StatefulWidget {
  final String text;
  final String navigate;
  NarrowCardViewAllOther(this.text, this.navigate);

  @override
  _NarrowCardViewAllOtherState createState() => _NarrowCardViewAllOtherState();
}

class _NarrowCardViewAllOtherState extends State<NarrowCardViewAllOther> {
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
                        widget.text,
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
              Padding(
                  padding: EdgeInsets.all(5),
                  child: narrowContainer(widget.navigate)),
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
  Widget narrowContainer(pageName) {
    return GestureDetector(
      onTap: () {},
      child: new Container(
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
      ),
    );
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
                              GestureDetector(
                                child: Text(
                                  widget.text,
                                  style: TextStyle(
                                      color: gouudWhite, fontSize: 10),
                                ),
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, 'SectionProducts');
                                },
                              ),
                              GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, 'SectionProducts');
                                  },
                                  child: Text(
                                    'Touch pointer move a lot',
                                    style: TextStyle(
                                        color: gouudFontColor, fontSize: 8),
                                  ))
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
