import 'package:flutter/material.dart';
import 'package:flutter_image/network.dart';
import 'package:gouud/UI_EN/constants/gouudColors.dart';
import 'package:gouud/cart/model/CartModel.dart';
import 'package:gouud/cart/provider/CartProvider.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:gouud/UI_EN/constants/BarContent.dart';

class Cart extends StatefulWidget {
  static const id = 'Cart';
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  Future<List<CartModel>> productsCart;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  var rating = 3.0;
  int stateIndicator = 0;
  String page;
  @override
  void initState() {
    super.initState();
    productsCart = CartProvider().cartData();
    page = Cart.id;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: gouudFloatingButton(),
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
          ListView(
              padding:
                  EdgeInsets.only(bottom: 120, left: 20, right: 20, top: 20),
              children: <Widget>[
                new Container(
                  child: FutureBuilder<List<CartModel>>(
                      future: productsCart,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          if (snapshot.data.length > 0) {
                            return GridView.count(
                              controller:
                                  new ScrollController(keepScrollOffset: false),
                              shrinkWrap: true,
                              crossAxisCount: 1,
                              childAspectRatio: 2.5,
                              mainAxisSpacing: 10,
                              children:
                                  List.generate(snapshot.data.length, (index) {
                                return CardItemSection(snapshot.data[index]);
                              }),
                            );
                          } else {
                            return Center(
                                child: Text(
                              'No items yet ...',
                              style: TextStyle(color: Colors.white),
                            ));
                          }
                        }
                        return Container(
                            height: 300,
                            child: Center(
                                child: CircularProgressIndicator(
                              backgroundColor: gouudBackgroundColor,
                            )));
                      }),
                ),
                location(),
                ratting(),
                addCoupon(),
                summary(),
                CardTotal(),
                note(),
                commentFeild()
              ]),
        ]),
      ),
    );
  }

  Widget gouudFloatingButton() {
    return new Padding(
        padding: EdgeInsets.only(bottom: 20),
        child: FloatingActionButton.extended(
            icon: stateIndicator == 0
                ? Icon(
                    Icons.monetization_on,
                    color: gouudWhite,
                  )
                : CircularProgressIndicator(
                    strokeWidth: 2,
                    backgroundColor: gouudBackgroundColor,
                  ),
            label: Text("Pay"),
            backgroundColor: gouudAppColor,
            onPressed: () {}));
  }

  Widget location() {
    return Container(
      margin: EdgeInsets.only(top: 0.0),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'AD LOCATION',
                style: TextStyle(fontSize: 12, color: gouudBlackFontColor),
              ),
              Row(
                children: <Widget>[
                  Text('CAIRO-EGYPT',
                      style: TextStyle(fontSize: 12, color: gouudAppColor)),
                  Icon(
                    Icons.location_on,
                    color: gouudAppColor,
                    size: 20,
                  )
                ],
              )
            ]),
      ),
      decoration: new BoxDecoration(
        color: gouudWhite,
        boxShadow: [BoxShadow(color: gouudWhite, spreadRadius: 1)],
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
      ),
    );
  }

  Widget summary() {
    return Container(
      margin: EdgeInsets.only(top: 15.0, bottom: 15),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: Icon(
                Icons.star,
                color: gouudWhite,
                size: 20,
              ),
            ),
            Text('APPLICATION SUMMARY',
                style: TextStyle(fontSize: 12, color: gouudWhite)),
          ],
        ),
      ),
      decoration: new BoxDecoration(
        color: gouudAppColor,
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
      ),
    );
  }

  Widget note() {
    return Container(
      margin: EdgeInsets.only(top: 15.0),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: Icon(
                Icons.edit,
                color: gouudWhite,
                size: 20,
              ),
            ),
            Text('YOU HAVE A NOTE?',
                style: TextStyle(fontSize: 12, color: gouudWhite)),
          ],
        ),
      ),
      decoration: new BoxDecoration(
        color: gouudAppColor,
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
      ),
    );
  }

  Widget commentFeild() {
    return Padding(
        padding: EdgeInsets.only(top: 20),
        child: TextField(
          // controller: messageController,
          minLines: 2,
          maxLines: 3,
          autocorrect: false,
          decoration: InputDecoration(
            hintText: 'WRITE A COMMENT',
            hintStyle: TextStyle(color: gouudBackgroundColor, fontSize: 12),
            filled: true,
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
              borderSide: BorderSide(color: Colors.grey),
            ),
          ),
        ));
  }

  Widget ratting() {
    return Container(
      height: 40,
      margin: EdgeInsets.only(top: 15.0),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              height: 30,
              width: 80,
              child: Center(
                child: Text(
                  'RATTING',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: gouudAppColor, fontSize: 10),
                ),
              ),
              decoration: new BoxDecoration(
                color: gouudWhite,
                boxShadow: [BoxShadow(color: gouudAppColor, spreadRadius: 1)],
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
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
          ],
        ),
      ),
      decoration: new BoxDecoration(
        color: gouudWhite,
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
      ),
    );
  }

  Widget addCoupon() {
    return Container(
      height: 40,
      margin: EdgeInsets.only(top: 15.0, bottom: 30.0),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('ADD DISCOUNT COUPON',
                style: TextStyle(fontSize: 12, color: gouudWhite)),
            Container(
              height: 30,
              width: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Center(
                    child: Text(
                      'ADD ',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: gouudWhite, fontSize: 10),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Icon(
                      Icons.add_circle,
                      color: gouudWhite,
                      size: 20,
                    ),
                  ),
                ],
              ),
              decoration: new BoxDecoration(
                color: gouudAppColor,
                boxShadow: [BoxShadow(color: gouudWhite, spreadRadius: 1)],
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
              ),
            ),
          ],
        ),
      ),
      decoration: new BoxDecoration(
        color: gouudAppColor,
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
      ),
    );
  }

  Widget bar() {
    return PreferredSize(
        preferredSize: const Size(double.infinity, 250),
        child: UpperBar(_scaffoldKey));
  }
}

class CardItemSection extends StatefulWidget {
  final CartModel data;
  CardItemSection(this.data);
  @override
  _CardItemSectionState createState() => _CardItemSectionState();
}

class _CardItemSectionState extends State<CardItemSection> {
  var rating = 3.0;
  int quantity = 0;
  int totalPrice = 0;

  @override
  Widget build(BuildContext context) {
    return Card(
        borderOnForeground: false,
        color: gouudAppColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(color: gouudWhite, width: .5),
        ),
        child: Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: <Widget>[
                Expanded(
                    flex: 1,
                    child: LayoutBuilder(builder: (context, constraints) {
                      return Container(
                        height: constraints.maxHeight,
                        width: constraints.maxWidth,
                        decoration: new BoxDecoration(
                          color: gouudWhite,
                          boxShadow: [
                            BoxShadow(color: gouudWhite, spreadRadius: .5)
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                        child: ClipRRect(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            child: Padding(
                              padding: EdgeInsets.all(5),
                              child: Image(
                                  image: new NetworkImageWithRetry(
                                      widget.data.productPhotoUrl),
                                  fit: BoxFit.contain),
                            )),
                      );
                    })),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          widget.data.productName,
                          style: TextStyle(color: gouudAppColor, fontSize: 14),
                          textAlign: TextAlign.center,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                              flex: 3,
                              child: Container(
                                height: 30,
                                child: Center(
                                  child: Text(
                                    widget.data.departmentName,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: gouudWhite, fontSize: 10),
                                  ),
                                ),
                                decoration: new BoxDecoration(
                                  color: gouudAppColor,
                                  boxShadow: [
                                    BoxShadow(
                                        color: gouudWhite, spreadRadius: 1)
                                  ],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25.0)),
                                ),
                              ),
                            ),
                            Expanded(flex: 1, child: Container()),
                            Expanded(
                                flex: 3,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    GestureDetector(
                                      // onTap: _decrement,
                                      child: Icon(
                                        Icons.remove_circle,
                                        color: gouudBackgroundColor,
                                      ),
                                    ),
                                    Text(
                                      quantity == 0
                                          ? widget.data.quantity.toString()
                                          : quantity.toString(),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: gouudWhite, fontSize: 12),
                                    ),
                                    GestureDetector(
                                        onTap: () {},
                                        child: Icon(
                                          Icons.add_circle,
                                          color: gouudBackgroundColor,
                                        ))
                                  ],
                                ))
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              flex: 3,
                              child: Container(
                                height: 30,
                                child: Center(
                                  child: Text(
                                    widget.data.totalPrice.toString(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: gouudWhite, fontSize: 10),
                                  ),
                                ),
                                decoration: new BoxDecoration(
                                  color: gouudAppColor,
                                  boxShadow: [
                                    BoxShadow(
                                        color: gouudWhite, spreadRadius: 1)
                                  ],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25.0)),
                                ),
                              ),
                            ),
                            Expanded(flex: 1, child: Container()),
                            Expanded(
                              flex: 3,
                              child: Container(
                                height: 40,
                                child: Center(
                                  child: Text(
                                    widget.data.productName,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: gouudWhite, fontSize: 10),
                                  ),
                                ),
                                decoration: new BoxDecoration(
                                  color: gouudAppColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25.0)),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            )));
  }
}

class CardTotal extends StatefulWidget {
  @override
  _CardTotalState createState() => _CardTotalState();
}

class _CardTotalState extends State<CardTotal> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: new BoxDecoration(
        color: gouudAppColor,
        borderRadius: BorderRadius.all(
          Radius.circular(25.0),
        ),
      ),
      child: Column(
        children: <Widget>[
          Expanded(
              flex: 3,
              child: Container(
                  decoration: new BoxDecoration(
                    color: gouudWhite,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.0),
                      topRight: Radius.circular(15.0),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            'NUMBER OF PRODUCT',
                            style: TextStyle(
                                color: gouudBlackFontColor, fontSize: 12),
                          ),
                          Text(
                            'TOTAL REQUEST',
                            style: TextStyle(
                                color: gouudBlackFontColor, fontSize: 12),
                          ),
                          Text(
                            'DISCOUNT',
                            style: TextStyle(
                                color: gouudBlackFontColor, fontSize: 12),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text('4',
                              style: TextStyle(
                                  color: gouudAppColor, fontSize: 12)),
                          Text('50 SAR ',
                              style: TextStyle(
                                  color: gouudAppColor, fontSize: 12)),
                          Text('20 % ',
                              style: TextStyle(
                                  color: gouudAppColor, fontSize: 12)),
                        ],
                      )
                    ],
                  ))),
          Expanded(
              child: Container(
                  decoration: new BoxDecoration(
                    color: gouudAppColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15.0),
                      bottomRight: Radius.circular(15.0),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        'TOTAL',
                        style: TextStyle(color: gouudWhite, fontSize: 12),
                      ),
                      Text('44 SAR ',
                          style: TextStyle(color: gouudWhite, fontSize: 12))
                    ],
                  ))),
        ],
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
