import 'package:flutter/material.dart';
import 'package:flutter_image/network.dart';
import 'package:gouud/product/view/Product.dart';
import 'package:gouud/UI_EN/constants/BarContent.dart';
import 'package:gouud/UI_EN/constants/gouudColors.dart';
import 'package:gouud/products/model/ProductsModel.dart';
import 'package:gouud/products/provider/ProductsProvider.dart';
import 'package:flutter_paginator/flutter_paginator.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class Products extends StatefulWidget {
  static const id = 'Products';
  final String brandId;
  final String brandName;
  Products(this.brandId, this.brandName);
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  GlobalKey<PaginatorState> paginatorGlobalKey = GlobalKey();
  Future<ProductsModel> product;
  ProductsProvider proObj;
  @override
  void initState() {
    super.initState();
    proObj = ProductsProvider(widget.brandId);
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
                new Center(
                  child: Text(widget.brandName),
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

  Widget loadingWidgetMaker() {
    return Container(
      alignment: Alignment.center,
      height: 160.0,
      child: CircularProgressIndicator(),
    );
  }

  Widget errorWidgetMaker(ProductsModel productsData, retryListener) {
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

  Widget emptyListWidgetMaker(ProductsModel productsData) {
    return Container(
        height: 300,
        child: Center(
          child: Text(
            'No products in the list',
            style: TextStyle(color: gouudAppColor, fontSize: 14),
          ),
        ));
  }

  Widget productItemBuilder(dynamic item, int index) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(0.0),
        child: new ProductCard(item),
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

class ProductCard extends StatefulWidget {
  final Data item;
  ProductCard(this.item);
  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  var rating = 3.0;
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
                                widget.item.discount + '%',
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
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15.0),
                              topRight: Radius.circular(15.0)),
                          child: Image(
                              image: new NetworkImageWithRetry(
                                  widget.item.images[0].image),
                              fit: BoxFit.contain),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Center(
                              child: Text(
                                widget.item.nameEn,
                                style: TextStyle(fontSize: 8),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Text(
                                  widget.item.price,
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
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(25.0),
                          bottomRight: Radius.circular(25.0),
                        ),
                      ),
                      child: GestureDetector(
                          onTap: () {
                            pushNewScreen(context,
                                screen: Product(widget.item.id.toString()),
                                platformSpecific: true,
                                withNavBar: false);
                          },
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
                          ))))
            ],
          ),
        ));
  }
}
