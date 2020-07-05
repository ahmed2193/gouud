import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image/network.dart';
import 'package:gouud/UI_EN/constants/BarContent.dart';
import 'package:gouud/UI_EN/constants/gouudColors.dart';
import 'package:gouud/product/model/ProductModel.dart';
import 'package:gouud/product/provider/ProductProvider.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class Product extends StatefulWidget {
  static const id = 'Product';
  final String url;
  Product(this.url);
  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  ProductProvider productObj;
  Future<ProductModel> productModel;
  @override
  void initState() {
    super.initState();
    productObj = new ProductProvider(widget.url);
    productModel = productObj.productData();
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
              FutureBuilder<ProductModel>(
                  future: productModel,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView(children: <Widget>[
                        new Padding(
                          padding: EdgeInsets.all(10),
                          child: CardItemSection(snapshot.data),
                        ),
                        RatingTab('RATINGS'),
                        new Container(
                          child: GridView.count(
                            controller:
                                new ScrollController(keepScrollOffset: false),
                            shrinkWrap: true,
                            // scrollDirection: Axis.vertical,
                            crossAxisCount: 1,
                            childAspectRatio: 4,
                            padding: EdgeInsets.only(
                                bottom: 10, left: 10, right: 10, top: 10),
                            mainAxisSpacing: 10,
                            children: List.generate(2, (index) {
                              return CardRate('user.png', 'abdelhameed');
                            }),
                          ),
                        ),
                        NarrowCardViewAll('BEST SELLER', () {}),
                        new Container(
                          margin: EdgeInsets.only(top: 20, bottom: 0),
                          height: 300,
                          child: GridView.count(
                            // controller: new ScrollController(keepScrollOffset: false),
                            // shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            crossAxisCount: 1,
                            childAspectRatio: 1.5,
                            padding:
                                EdgeInsets.only(bottom: 50, left: 5, right: 5),
                            children: List.generate(10, (index) {
                              return ProductCard();
                            }),
                          ),
                        ),
                      ]);
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
            ])));
  }

  Widget bar() {
    return PreferredSize(
      preferredSize: const Size(double.infinity, 50),
      child: UpperBar(_scaffoldKey),
    );
  }
}

class CardItemSection extends StatefulWidget {
  final ProductModel data;
  CardItemSection(this.data);
  @override
  _CardItemSectionState createState() => _CardItemSectionState();
}

class _CardItemSectionState extends State<CardItemSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        new Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Imageshow(widget.data.productFiles),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.favorite_border,
                    color: gouudAppColor,
                    size: 30,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 10, left: 10),
                    child: Icon(Icons.chat_bubble_outline,
                        color: gouudAppColor, size: 30),
                  ),
                  Icon(Icons.share, color: gouudAppColor, size: 30),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: Text(
                      widget.data.productName,
                      style: TextStyle(color: gouudAppColor, fontSize: 14),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              Container(
                child: Text(
                  widget.data.productDescription,
                  style: TextStyle(color: gouudAppColor, fontSize: 10),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Container(
                          child: Padding(
                            padding: EdgeInsets.all(3),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Text(
                                  '30 SAR',
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: gouudAppColor,
                                      decoration: TextDecoration.lineThrough),
                                ),
                                Text(
                                  widget.data.productPrice,
                                  style: TextStyle(
                                      fontSize: 14, color: gouudAppColor),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                          decoration: new BoxDecoration(
                            color: gouudWhite,
                            boxShadow: [
                              BoxShadow(color: gouudWhite, spreadRadius: 1)
                            ],
                            borderRadius:
                                BorderRadius.all(Radius.circular(25.0)),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Container(
                          child: Padding(
                            padding: EdgeInsets.all(7),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Icon(
                                  Icons.remove_circle,
                                  color: gouudAppColor,
                                ),
                                Text(
                                  '1',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: gouudAppColor,
                                  ),
                                ),
                                Icon(
                                  Icons.add_circle,
                                  color: gouudAppColor,
                                ),
                              ],
                            ),
                          ),
                          decoration: new BoxDecoration(
                            color: gouudWhite,
                            boxShadow: [
                              BoxShadow(color: gouudWhite, spreadRadius: 1)
                            ],
                            borderRadius:
                                BorderRadius.all(Radius.circular(25.0)),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 15.0),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'AD LOCATION',
                            style: TextStyle(fontSize: 12),
                          ),
                          Row(
                            children: <Widget>[
                              Text('CAIRO-EGYPT',
                                  style: TextStyle(
                                      fontSize: 12, color: gouudAppColor)),
                              Icon(
                                Icons.location_on,
                                color: gouudAppColor,
                              )
                            ],
                          )
                        ]),
                  ),
                  decoration: new BoxDecoration(
                    color: gouudWhite,
                    boxShadow: [BoxShadow(color: gouudWhite, spreadRadius: 1)],
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  )),
              Container(
                  margin: EdgeInsets.only(top: 15.0),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'RATING',
                            style: TextStyle(fontSize: 12),
                          ),
                          Center(
                              child: SmoothStarRating(
                            rating: widget.data.productRate,
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
                          ))
                        ]),
                  ),
                  decoration: new BoxDecoration(
                    color: gouudWhite,
                    boxShadow: [BoxShadow(color: gouudWhite, spreadRadius: 1)],
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  ))
            ],
          ),
        ),
      ],
    );
  }
}

class CardBestSeller extends StatefulWidget {
  @override
  _CardBestSellerState createState() => _CardBestSellerState();
}

class _CardBestSellerState extends State<CardBestSeller> {
  var rating = 3.0;
  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(26)),
        child: GestureDetector(
            onTap: () {},
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
                                    color: gouudAppColor,
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
                          Container(
                              child: Image(
                            image: AssetImage(
                              'assets/icons/bottle1.png',
                            ),
                            fit: BoxFit.fill,
                          )),
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
                              'CYLINDER HEAD 2020',
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

class MiddelTab extends StatefulWidget {
  final String text;
  MiddelTab(this.text);
  @override
  _MiddelTabState createState() => _MiddelTabState();
}

class _MiddelTabState extends State<MiddelTab> {
  @override
  Widget build(BuildContext context) {
    return new Padding(
        padding: EdgeInsets.all(10),
        child: new Container(
            height: 40,
            decoration: new BoxDecoration(
              color: gouudAppColor,
              boxShadow: [BoxShadow(color: gouudWhite, spreadRadius: 1)],
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
            ),
            child: Padding(
                padding: EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      widget.text,
                      style: TextStyle(color: gouudWhite, fontSize: 10),
                      textAlign: TextAlign.center,
                    ),
                    Container(
                      width: 100,
                      height: 30,
                      child: Center(
                          child: Text(
                        'VIEW ALL',
                        style: TextStyle(fontSize: 8, color: gouudWhite),
                      )),
                      decoration: new BoxDecoration(
                        color: gouudAppColor,
                        boxShadow: [
                          BoxShadow(color: gouudWhite, spreadRadius: 1)
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(25.0)),
                      ),
                    )
                  ],
                ))));
  }
}

class RatingTab extends StatefulWidget {
  final String text;
  RatingTab(this.text);
  @override
  _RatingTabState createState() => _RatingTabState();
}

class _RatingTabState extends State<RatingTab> {
  @override
  Widget build(BuildContext context) {
    return new Padding(
        padding: EdgeInsets.all(10),
        child: new Container(
            height: 40,
            decoration: new BoxDecoration(
              color: gouudAppColor,
              boxShadow: [BoxShadow(color: gouudWhite, spreadRadius: 1)],
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
            ),
            child: Padding(
                padding: EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      Icons.star,
                      color: gouudBackgroundColor,
                      size: 25,
                    ),
                    Text(
                      widget.text,
                      style: TextStyle(color: gouudWhite, fontSize: 12),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ))));
  }
}

class CardRate extends StatefulWidget {
  final String image;
  final String text;
  CardRate(this.image, this.text);
  @override
  _CardRateState createState() => _CardRateState();
}

class _CardRateState extends State<CardRate> {
  double rating = 3.5;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 10, top: 10, bottom: 10),
                child: Image(
                  width: 50,
                  height: 50,
                  image: AssetImage('assets/icons/' + widget.image),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  GestureDetector(
                    child: Text(
                      widget.text,
                      style: TextStyle(color: gouudWhite, fontSize: 14),
                    ),
                    onTap: () {},
                  ),
                  Center(
                      child: SmoothStarRating(
                    rating: rating,
                    isReadOnly: false,
                    size: 20,
                    color: gouudBackgroundColor,
                    borderColor: gouudBackgroundColor,
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
                  GestureDetector(
                      onTap: () {},
                      child: Text(
                        'this vehicle is very good',
                        style: TextStyle(color: gouudFontColor, fontSize: 12),
                      ))
                ],
              ),
            ],
          ),
          GestureDetector(
            onTap: () {},
            child: Icon(
              Icons.arrow_forward_ios,
              color: gouudFontColor,
              size: 20,
            ),
          )
        ],
      ),
      decoration: new BoxDecoration(
        color: gouudAppColor,
        boxShadow: [BoxShadow(color: gouudWhite, spreadRadius: .5)],
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
      ),
    );
  }
}

class Imageshow extends StatefulWidget {
  final List<ProductFiles> data;
  Imageshow(this.data);
  @override
  _ImageshowState createState() => _ImageshowState();
}

class _ImageshowState extends State<Imageshow> {
  ///image mapping

  int _current = 0;
  List<Widget> imageSliders;
  @override
  void initState() {
    super.initState();
    imageSliders = widget.data
        .map((item) => Container(
              child: Container(
                margin: EdgeInsets.all(10.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    child: Stack(
                      children: <Widget>[
                        Image(
                            image: new NetworkImageWithRetry(
                              item.filePath,
                            ),
                            fit: BoxFit.contain),
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
  }

  _changeImage(index) {
    setState(() {
      _current = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          decoration: new BoxDecoration(
            color: gouudWhite,
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
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
                        color: gouudAppColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25.0),
                            bottomRight: Radius.circular(25.0)),
                      ),
                    ),
                  ]),
              Container(
                child: CarouselSlider(
                  items: imageSliders,
                  options: CarouselOptions(
                      autoPlay: true,
                      enlargeCenterPage: true,
                      aspectRatio: 1.5,
                      onPageChanged: (index, reason) {
                        _changeImage(index);
                      }),
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.data.map((url) {
            int index = widget.data.indexOf(url);
            return Padding(
                padding: EdgeInsets.all(10),
                child: GestureDetector(
                    // onTap: _changeImage(index),
                    child: Container(
                        width: 40,
                        height: 40,
                        // margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _current == index ? gouudAppColor : gouudWhite,
                        ),
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.all(2),
                            child: Container(
                                width: 38,
                                height: 38,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: gouudWhite,
                                ),
                                child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20.0)),
                                    child: Padding(
                                      padding: EdgeInsets.all(5),
                                      child: Image(
                                          image: NetworkImageWithRetry(
                                              url.filePath),
                                          fit: BoxFit.contain),
                                    ))),
                          ),
                        ))));
          }).toList(),
        ),
      ],
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
