import 'package:flutter/material.dart';
import 'package:gouud/UI_EN/constants/gouudColors.dart';
import 'package:gouud/cart/view/Cart.dart';

class UpperBar extends StatefulWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey;
  UpperBar(this._scaffoldKey);
  @override
  _UpperBarState createState() => _UpperBarState();
}

class _UpperBarState extends State<UpperBar> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 70.0,
      child: Padding(
        padding: EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(left: 0),
                    child: GestureDetector(
                      onTap: () {
                        widget._scaffoldKey.currentState.openDrawer();
                      },
                      child: Icon(
                        Icons.menu,
                        color: gouudWhite,
                        size: 25,
                      ),
                    )),
                Padding(
                    padding: EdgeInsets.only(left: 0),
                    child: GestureDetector(
                        onTap: () {
                          widget._scaffoldKey.currentState.openDrawer();
                        },
                        child: Row(
                          children: <Widget>[
                            Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Icon(
                                    Icons.location_on,
                                    color: gouudWhite,
                                    size: 15,
                                  ),
                                )),
                            Padding(
                                padding: EdgeInsets.only(left: 0),
                                child: GestureDetector(
                                    onTap: () {},
                                    child: Text(
                                      'CAIRO',
                                      style: TextStyle(
                                          color: gouudWhite, fontSize: 10),
                                    ))),
                            Padding(
                                padding: EdgeInsets.only(left: 0),
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Icon(
                                    Icons.arrow_drop_down,
                                    color: gouudWhite,
                                    size: 15,
                                  ),
                                )),
                          ],
                        )))
              ],
            ),
            Row(
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(right: 2),
                    child: GestureDetector(
                      onTap: () {
                        widget._scaffoldKey.currentState.openDrawer();
                      },
                      child: Icon(
                        Icons.search,
                        color: gouudWhite,
                        size: 25,
                      ),
                    )),
                Padding(
                    padding: EdgeInsets.only(left: 1),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => Cart()));
                      },
                      child: Container(
                        width: 110,
                        height: 30,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                                padding: EdgeInsets.only(right: 1),
                                child: GestureDetector(
                                  onTap: () {
                                    widget._scaffoldKey.currentState
                                        .openDrawer();
                                  },
                                  child: Icon(
                                    Icons.shopping_cart,
                                    color: gouudWhite,
                                    size: 22,
                                  ),
                                )),
                            CircleIcon(),
                            Padding(
                              padding: EdgeInsets.only(left: 4),
                              child: Text(
                                'CART = 600.00\$',
                                style:
                                    TextStyle(color: gouudWhite, fontSize: 8),
                              ),
                            )
                          ],
                        ),
                        decoration: new BoxDecoration(
                          color: gouudAppColor,
                          boxShadow: [
                            BoxShadow(color: gouudWhite, spreadRadius: .5)
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                      ),
                    ))
              ],
            ),
          ],
        ),
      ),
      decoration: new BoxDecoration(
        color: gouudAppColor,
        boxShadow: [BoxShadow(color: gouudWhite, spreadRadius: .2)],
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(40.0)),
      ),
    );
  }
}

class CircleIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double size = 13.0;

    return Container(
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
        style: TextStyle(color: gouudWhite, fontSize: 8),
      ),
    );
  }
}
