import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_image/network.dart';
import 'package:flutter_paginator/flutter_paginator.dart';
import 'package:gouud/UI_EN/constants/BarContent.dart';
import 'package:gouud/UI_EN/constants/gouudColors.dart';
import 'package:gouud/favourite/model/FavouriteModel.dart';
import 'package:gouud/favourite/provider/FavouriteProvider.dart';
import 'package:gouud/home/Logic/HomeLogic.dart';
import 'package:gouud/home/provider/HomeProvider.dart';
import 'package:gouud/login/view/Login.dart';
import 'package:gouud/product/view/Product.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:toast/toast.dart';

class Favourite extends StatefulWidget {
  static const id = 'Favourite';
  @override
  _FavouriteState createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  GlobalKey<PaginatorState> paginatorGlobalKey = GlobalKey();
  Future<FavouriteModel> product;
  FavouritesProvider proObj;
  List<String> cartProducts;
  List<String> quantityProducts;
  List<String> favouriteProducts;
  @override
  void initState() {
    super.initState();
    proObj = FavouritesProvider();
    HomeProvider homeProvider = new HomeProvider();
    homeProvider.getDataList().whenComplete(() {
      cartProducts = homeProvider.cartIds;
      quantityProducts = homeProvider.cartIdsQuantity;
      favouriteProducts = homeProvider.favouriteIds;
    });
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
                  child: Paginator.gridView(
                    shrinkWrap: true,
                    padding: EdgeInsets.only(
                        bottom: 55, left: 10, right: 10, top: 10),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.7,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0),
                    key: paginatorGlobalKey,
                    pageLoadFuture: proObj.productsData,
                    pageItemsGetter: proObj.listItemsGetterPages,
                    listItemBuilder: productItemBuilder,
                    loadingWidgetBuilder: loadingWidgetMaker,
                    errorWidgetBuilder: errorWidgetMaker,
                    emptyListWidgetBuilder: emptyListWidgetMaker,
                    totalItemsGetter: proObj.totalPagesGetter,
                    pageErrorChecker: proObj.pageErrorChecker,
                    scrollPhysics: BouncingScrollPhysics(),
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

  Widget productItemBuilder(dynamic item, int index) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(0.0),
        child: new ProductCard(
            item, cartProducts, quantityProducts, favouriteProducts, (value) {
          setState(() {
            cartProducts.add(value);
            quantityProducts.add('1');
          });
        }, (value) {
          setState(() {
            favouriteProducts.add(value);
          });
        }),
      ),
    );
  }

  Widget loadingWidgetMaker() {
    return Container(
      alignment: Alignment.center,
      height: 160.0,
      child: CircularProgressIndicator(),
    );
  }

  Widget errorWidgetMaker(FavouriteModel productsData, retryListener) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text("error"),
        ),
        FlatButton(
          onPressed: retryListener,
          child: Text('Retry'),
        )
      ],
    );
  }

  Widget emptyListWidgetMaker(FavouriteModel productsData) {
    return Container(
        height: 300,
        child: Center(
          child: Text(
            'No products in the list',
            style: TextStyle(color: gouudAppColor, fontSize: 14),
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

class ProductCard extends StatefulWidget {
  final Data item;
  final List<String> cartProducts;
  final List<String> quantityProducts;
  final List<String> favouriteProducts;
  final Function(String) addToCartList;
  final Function(String) addToFavouriteList;
  ProductCard(this.item, this.cartProducts, this.quantityProducts,
      this.favouriteProducts, this.addToCartList, this.addToFavouriteList);
  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  int loading = 1;
  int inCart;
  int infavourite;

  void initState() {
    super.initState();
    if (widget.cartProducts.contains(widget.item.product.id.toString())) {
      inCart = 2;
    } else {
      inCart = 1;
    }
    if (widget.favouriteProducts.contains(widget.item.product.id.toString())) {
      infavourite = 2;
    } else {
      infavourite = 1;
    }
  }

  addToCart(productId) {
    HomeLogic homeLogic = new HomeLogic();
    HomeProvider homeProvider = new HomeProvider();
    homeLogic.checkLogin().whenComplete(() {
      if (homeLogic.inner) {
        setState(() {
          loading = 2;
        });
        homeProvider.cart(productId, 1).whenComplete(() {
          print(homeProvider.statusCode);
          if (homeProvider.statusCode == '201') {
            setState(() {
              inCart = 2;
              widget.addToCartList(productId);
              loading = 1;
            });
            Toast.show("Product has added to cart", context,
                duration: 4, gravity: Toast.BOTTOM);
          } else if (homeProvider.statusCode == '422') {
            Toast.show("Product already in cart", context,
                duration: 4, gravity: Toast.BOTTOM);
            setState(() {
              loading = 1;
            });
          } else {
            Toast.show("server error please try later ", context,
                duration: 4, gravity: Toast.BOTTOM);
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

  addToFavourite(productId) {
    HomeLogic homeLogic = new HomeLogic();
    HomeProvider homeProvider = new HomeProvider();
    homeLogic.checkLogin().whenComplete(() {
      if (homeLogic.inner) {
        homeProvider.favourite(productId).whenComplete(() {
          print(homeProvider.statusCode);
          if (homeProvider.statusCode == '201') {
            setState(() {
              infavourite = 2;
            });
            Toast.show("Product has added to favourite", context,
                duration: 4, gravity: Toast.BOTTOM);
          } else if (homeProvider.statusCode == '422') {
            Toast.show("Product already in favourite", context,
                duration: 4, gravity: Toast.BOTTOM);
          } else {
            Toast.show("server error please try later ", context,
                duration: 4, gravity: Toast.BOTTOM);
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
                            GestureDetector(
                                onTap: () {
                                  // addToFavourite(
                                  //     widget.item.product.id.toString());
                                },
                                child: Padding(
                                    padding: EdgeInsets.only(right: 10, top: 5),
                                    child: Icon(
                                      Icons.favorite,
                                      color: gouudFavourite,
                                      size: 30,
                                    )))
                          ]),
                      Expanded(
                          flex: 3,
                          child: GestureDetector(
                            onTap: () {
                              pushNewScreen(context,
                                  screen: Product(
                                      widget.item.product.id.toString()),
                                  platformSpecific: true,
                                  withNavBar: false);
                            },
                            child: Padding(
                              padding: EdgeInsets.all(2),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15.0),
                                      topRight: Radius.circular(15.0)),
                                  child: new Image(
                                    image: new NetworkImageWithRetry(
                                        widget.item.product.images[0].image),
                                  )),
                            ),
                          )),
                      Expanded(
                        flex: 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Center(
                              child: Text(
                                widget.item.product.nameEn,
                                style: TextStyle(fontSize: 8),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Text(
                                  widget.item.product.price.toString() + '',
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
                  child: GestureDetector(
                      onTap: () {
                        addToCart(widget.item.product.id);
                      },
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
                              loading == 1
                                  ? Icon(
                                      Icons.shopping_cart,
                                      color:
                                          inCart == 1 ? gouudWhite : gouudGreen,
                                    )
                                  : Center(
                                      child: CircularProgressIndicator(
                                      backgroundColor: gouudBackgroundColor,
                                    )),
                              Text(
                                "ADD TO CART",
                                style:
                                    TextStyle(color: gouudWhite, fontSize: 10),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ))))
            ],
          ),
        ));
  }
}
