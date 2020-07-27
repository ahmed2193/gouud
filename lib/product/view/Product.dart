import 'dart:async';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image/network.dart';
import 'package:gouud/UI_EN/constants/BarContent.dart';
import 'package:gouud/UI_EN/constants/gouudColors.dart';
import 'package:gouud/login/view/Login.dart';
import 'package:gouud/product/Logic/ProductLogic.dart';
import 'package:gouud/product/model/CommentModel.dart';
import 'package:gouud/product/model/ProductModel.dart';
import 'package:gouud/product/provider/ProductProvider.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
// import 'package:gouud/sectionProducts/model/BestSellerModel.dart';
// import 'package:gouud/sectionProducts/provider/BestSellerProvider.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:toast/toast.dart';

class Product extends StatefulWidget {
  static const id = 'Product';
  final String productId;
  Product(this.productId);
  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  ProductProvider productObj;
  Future<ProductModel> productModel;
  Future<CommentModel> commentModel;
  bool newComment = false;
  // Future<BestSellerModel> bestSeller;
  int productId;
  int quantity;
  int stateIndicator = 0;
  @override
  void initState() {
    super.initState();
    productObj = new ProductProvider(widget.productId);
    productModel = productObj.productData();
    // bestSeller = BestSellerProvider().bestSellerData();
  }

  _setData(int productId, int quantity) {
    setState(() {
      this.productId = productId;
      this.quantity = quantity;
    });
  }

  _addToCart() {
    print(productId.toString());
    print(quantity.toString());

    setState(() {
      stateIndicator = 1;
    });
    productObj
        .addToCart(productId.toString(), quantity.toString())
        .whenComplete(() {
      setState(() {
        stateIndicator = 0;
      });
      if (productObj.statusCode == '200') {
        print('done');
        Toast.show("Product has added to cart", context,
            duration: 4, gravity: Toast.BOTTOM);
      } else if (productObj.statusCode == '401') {
        Toast.show(
          "Please login to continue",
          context,
          duration: 4,
          gravity: Toast.BOTTOM,
        );
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (BuildContext context) => Login()));
        print('failed');
      } else {
        Toast.show(
          "server error please try later ",
          context,
          duration: 4,
          gravity: Toast.BOTTOM,
        );
      }
    });
  }

  refreshComment(comment) {
    setState(() {
      newComment = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: gouudFloatingButton(),
        extendBody: true,
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
                      return ListView(
                          padding: EdgeInsets.only(bottom: 60, top: 60),
                          children: <Widget>[
                            new Padding(
                              padding: EdgeInsets.all(10),
                              child: CardItemSection(
                                  snapshot.data.data, _setData, () {
                                setState(() {
                                  productModel = productObj.productData();
                                });
                              }),
                            ),
                            RatingTab('RATINGS'),
                            !newComment
                                ? snapshot.data.data.comments.length > 0
                                    ? new Container(
                                        child: GridView.count(
                                          controller: new ScrollController(
                                              keepScrollOffset: false),
                                          shrinkWrap: true,
                                          // scrollDirection: Axis.vertical,
                                          crossAxisCount: 1,
                                          childAspectRatio: 4,
                                          padding: EdgeInsets.only(
                                              bottom: 10,
                                              left: 10,
                                              right: 10,
                                              top: 10),
                                          mainAxisSpacing: 10,
                                          children: List.generate(
                                              snapshot.data.data.comments
                                                  .length, (index) {
                                            return CardRate(snapshot
                                                .data.data.comments[index]);
                                          }),
                                        ),
                                      )
                                    : Container()
                                : FutureBuilder<CommentModel>(
                                    future: commentModel,
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        new Container(
                                          child: GridView.count(
                                              controller: new ScrollController(
                                                  keepScrollOffset: false),
                                              shrinkWrap: true,
                                              // scrollDirection: Axis.vertical,
                                              crossAxisCount: 1,
                                              childAspectRatio: 4,
                                              padding: EdgeInsets.only(
                                                  bottom: 10,
                                                  left: 10,
                                                  right: 10,
                                                  top: 10),
                                              mainAxisSpacing: 10,
                                              children: List.generate(
                                                  snapshot.data.count, (index) {
                                                return Container();
                                              })),
                                        );
                                      } else {
                                        return Container();
                                      }
                                      return Container(
                                        height: 200,
                                        child: Center(
                                          child: CircularProgressIndicator(
                                            backgroundColor:
                                                gouudBackgroundColor,
                                          ),
                                        ),
                                      );
                                    }),
                            // NarrowCardViewAll('BEST SELLER', () {}),
                            // new Container(
                            //   // padding: EdgeInsets.only(bottom: 50),
                            //   margin: EdgeInsets.only(top: 20, bottom: 60),
                            //   height: 300,
                            //   child: FutureBuilder<BestSellerModel>(
                            //       future: bestSeller,
                            //       builder: (context, snapshot) {
                            //         if (snapshot.hasData) {
                            //           if (snapshot.data.data.length > 0) {
                            //             return GridView.count(
                            //               // controller: new ScrollController(keepScrollOffset: false),
                            //               // shrinkWrap: true,
                            //               scrollDirection: Axis.horizontal,
                            //               crossAxisCount: 1,
                            //               childAspectRatio: 1.6,
                            //               padding: EdgeInsets.only(
                            //                   bottom: 10, left: 5, right: 5),
                            //               children: List.generate(
                            //                   snapshot.data.data.length,
                            //                   (index) {
                            //                 return ProductCard(
                            //                     snapshot
                            //                         .data.data[index].nameEn,
                            //                     snapshot.data.data[index].brand
                            //                         .department.nameEn,
                            //                     snapshot.data.data[index].price,
                            //                     snapshot.data.data[index].rate,
                            //                     snapshot.data.data[index]
                            //                         .images[0].image,
                            //                     snapshot.data.data[index].id
                            //                         .toString());
                            //               }),
                            //             );
                            //           } else {
                            //             return Center(
                            //                 child: Text(
                            //               'No Sections yet ...',
                            //               style: TextStyle(color: Colors.white),
                            //             ));
                            //           }
                            //         }
                            //         return Center(
                            //             child: CircularProgressIndicator(
                            //           backgroundColor: gouudBackgroundColor,
                            //         ));
                            //       }),
                            // ),
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

  Widget gouudFloatingButton() {
    return new FloatingActionButton.extended(
        icon: stateIndicator == 0
            ? Icon(
                Icons.add_shopping_cart,
                color: gouudWhite,
              )
            : CircularProgressIndicator(
                strokeWidth: 2,
                backgroundColor: gouudBackgroundColor,
              ),
        label: Text("add to cart"),
        backgroundColor: gouudAppColor,
        onPressed: _addToCart);
  }

  Widget bar() {
    return PreferredSize(
      preferredSize: const Size(double.infinity, 50),
      child: UpperBar(_scaffoldKey),
    );
  }
}

class CardItemSection extends StatefulWidget {
  final Data data;
  final Function(int, int) setData;

  final Function addComment;

  CardItemSection(this.data, this.setData, this.addComment);
  @override
  _CardItemSectionState createState() => _CardItemSectionState();
}

class _CardItemSectionState extends State<CardItemSection> {
  int count = 1;
  double productPrice = 0;
  double userRate = 0;
  int loading = 1;

  final TextEditingController commentController = new TextEditingController();

  void initState() {
    super.initState();
    productPrice =
        widget.data.price - (widget.data.price * (widget.data.discount / 100));
  }

  _increment() {
    setState(() {
      count = count + 1;
      productPrice = widget.data.price -
          (widget.data.price * (widget.data.discount / 100));
      productPrice = productPrice * count;
      widget.setData(widget.data.id, count);
    });
  }

  _decrement() {
    if (count > 1) {
      setState(() {
        count = count - 1;
        productPrice = widget.data.price -
            (widget.data.price * (widget.data.discount / 100));
        if (count != 0) {
          productPrice = productPrice * count;
        }
        widget.setData(widget.data.id, count);
      });
    }
  }

  _setComment(productId, comment, rate) {
    ProductLogic productLogic = new ProductLogic();
    ProductProvider productProvider = new ProductProvider(productId.toString());
    productLogic.checkLogin(productId.toString()).whenComplete(() {
      if (productLogic.inner) {
        setState(() {
          loading = 2;
        });
        productProvider
            .setComment(productId.toString(), comment, rate.toString())
            .whenComplete(() {
          print(productProvider.statusCode);
          if (productProvider.statusCode == '201') {
            setState(() {
              loading = 1;
            });
            widget.addComment();
            Toast.show("Comment has added successfully", context,
                duration: 4, gravity: Toast.TOP);
          } else {
            Toast.show("server error please try later ", context,
                duration: 4, gravity: Toast.TOP);
          }
        });
      } else {
        Toast.show("please login to complete the process", context,
            duration: 4, gravity: Toast.CENTER);
        Timer(new Duration(milliseconds: 1000), () {
          pushNewScreen(
            context,
            screen: Login(),
            platformSpecific: true,
            withNavBar: false,
          );
        });
      }
    });
  }

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
              Imageshow(widget.data.images, widget.data.discount.toString()),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.favorite_border,
                    color: gouudAppColor,
                    size: 30,
                  ),
                  Padding(
                      padding: EdgeInsets.only(right: 10, left: 10),
                      child: GestureDetector(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) => new Dialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            30.0)), //this right here
                                    backgroundColor: gouudAppColor,
                                    child: Container(
                                      height: 200.0,
                                      width: 300.0,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            right: 20, left: 20),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            TextField(
                                              controller: commentController,
                                              minLines: 1,
                                              maxLines: 3,
                                              autocorrect: false,
                                              onChanged: (value) {},
                                              decoration: InputDecoration(
                                                hintText: 'WRITE A COMMENT',
                                                hintStyle: TextStyle(
                                                    color: gouudAppColor,
                                                    fontSize: 12),
                                                filled: true,
                                                fillColor: Colors.white,
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              25.0)),
                                                  borderSide: BorderSide(
                                                      color: Colors.grey),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              25.0)),
                                                  borderSide: BorderSide(
                                                      color: Colors.grey),
                                                ),
                                              ),
                                            ),
                                            Center(
                                                child: SmoothStarRating(
                                              rating: 0,
                                              isReadOnly: false,
                                              size: 20,
                                              color: gouudRate,
                                              borderColor: gouudRate,
                                              filledIconData: Icons.star,
                                              halfFilledIconData:
                                                  Icons.star_half,
                                              defaultIconData:
                                                  Icons.star_border,
                                              starCount: 5,
                                              allowHalfRating: true,
                                              spacing: 2.0,
                                              onRated: (value) {
                                                userRate = value;
                                              },
                                            )),
                                            Container(
                                              height: 35,
                                              margin: EdgeInsets.only(
                                                  right: 30, left: 30),
                                              decoration: new BoxDecoration(
                                                color: gouudBackgroundColor,
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(25.0),
                                                ),
                                              ),
                                              child: GestureDetector(
                                                  onTap: () {
                                                    _setComment(
                                                        widget.data.id,
                                                        commentController.text
                                                            .trim(),
                                                        userRate);
                                                    // widget.refreshComment();
                                                    Navigator.pop(context);
                                                  },
                                                  child: Center(
                                                    child: Text(
                                                      'Add',
                                                      style: TextStyle(
                                                          color: gouudWhite,
                                                          fontSize: 12),
                                                      textAlign:
                                                          TextAlign.start,
                                                    ),
                                                  )),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ));
                        },
                        child: Icon(Icons.chat_bubble_outline,
                            color: gouudAppColor, size: 30),
                      )),
                  Icon(Icons.share, color: gouudAppColor, size: 30),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: Text(
                      widget.data.nameEn,
                      style: TextStyle(color: gouudAppColor, fontSize: 14),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              // Container(
              //   child: Text(
              //     widget.data.descritpionEn + "",
              //     style: TextStyle(color: gouudAppColor, fontSize: 10),
              //   ),
              // ),
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
                                  widget.data.price.toString() + '',
                                  style: TextStyle(
                                      fontSize: 8,
                                      color: gouudAppColor,
                                      decoration: TextDecoration.lineThrough),
                                ),
                                Text(
                                  productPrice.toString(),
                                  style: TextStyle(
                                      fontSize: 12, color: gouudAppColor),
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
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                GestureDetector(
                                    onTap: _decrement,
                                    child: Icon(
                                      Icons.remove_circle,
                                      color: gouudAppColor,
                                      size: 30,
                                    )),
                                Text(
                                  count.toString(),
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: gouudAppColor,
                                  ),
                                ),
                                GestureDetector(
                                    onTap: _increment,
                                    child: Icon(
                                      Icons.add_circle,
                                      color: gouudAppColor,
                                      size: 30,
                                    )),
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
                            'Add location',
                            style: TextStyle(
                                fontSize: 12, color: gouudGrayFontColor),
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
                            'Rating',
                            style: TextStyle(
                                fontSize: 12, color: gouudGrayFontColor),
                          ),
                          Center(
                              child: SmoothStarRating(
                            rating: widget.data.rate,
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

  Dialog commentDialog(setComment(comment), setRate(rate)) => Dialog();
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
  final Comments data;
  CardRate(this.data);
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
                    image: new NetworkImageWithRetry(
                      widget.data.user.image,
                    )),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  GestureDetector(
                    child: Text(
                      widget.data.user.name,
                      style: TextStyle(color: gouudWhite, fontSize: 14),
                    ),
                    onTap: () {},
                  ),
                  Center(
                      child: SmoothStarRating(
                    rating: widget.data.rate.toDouble(),
                    isReadOnly: true,
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
                        widget.data.text,
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
  final String discount;
  final List<Images> data;
  Imageshow(this.data, this.discount);
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
                              item.image,
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
                        widget.discount + '%',
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
                                          image:
                                              NetworkImageWithRetry(url.image),
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
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          Product(widget.navigationUrl)));
                            },
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
                          )),
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
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                            style: TextStyle(color: gouudWhite, fontSize: 10),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      )))
            ],
          ),
        ));
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
