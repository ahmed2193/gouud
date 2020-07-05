import 'package:flutter/material.dart';
import 'package:gouud/UI_EN/constants/gouudColors.dart';
import 'package:gouud/UI_EN/constants/BarContent.dart';
import 'package:gouud/orderDetails/view/OrderDetails.dart';

class Orders extends StatefulWidget {
  static const id = 'Orders';
  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  var rating = 3.0;

  String page;
  @override
  void initState() {
    super.initState();
    page = Orders.id;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
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
                  EdgeInsets.only(bottom: 70, left: 20, right: 20, top: 100),
              children: <Widget>[
                ToggleButton(),
                new Container(
                  child: GridView.count(
                    controller: new ScrollController(keepScrollOffset: false),
                    shrinkWrap: true,
                    // scrollDirection: Axis.vertical,
                    crossAxisCount: 1,
                    childAspectRatio: 2,
                    padding: EdgeInsets.only(
                        bottom: 10, left: 10, right: 10, top: 10),
                    mainAxisSpacing: 10,
                    children: List.generate(5, (index) {
                      return CardTotal();
                    }),
                  ),
                ),
              ]),
        ]),
      ),
    );
  }

  Widget bar() {
    return PreferredSize(
        preferredSize: const Size(double.infinity, 250),
        child: UpperBar(_scaffoldKey));
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
                            'Order details',
                            style: TextStyle(
                                color: gouudBlackFontColor, fontSize: 12),
                          ),
                          Text(
                            'Order date',
                            style: TextStyle(
                                color: gouudBlackFontColor, fontSize: 12),
                          ),
                          Text(
                            'Order status',
                            style: TextStyle(
                                color: gouudBlackFontColor, fontSize: 12),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text('4 AQUA Water',
                              style: TextStyle(
                                  color: gouudAppColor, fontSize: 12)),
                          Text('30/6/2020',
                              style: TextStyle(
                                  color: gouudAppColor, fontSize: 12)),
                          Text('Waiting',
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
                      new Expanded(
                        child: new GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        OrderDetails()));
                          },
                          child: new Container(
                            decoration: new BoxDecoration(
                                border: Border(
                                    right: BorderSide(color: gouudWhite))),
                            child: new Center(
                              child: Text(
                                'Details',
                                style:
                                    TextStyle(color: gouudWhite, fontSize: 12),
                              ),
                            ),
                          ),
                        ),
                      ),
                      new Expanded(
                        child: new GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        OrderDetails()));
                          },
                          child: new Container(
                            child: new Center(
                              child: Text(
                                'Cancel',
                                style:
                                    TextStyle(color: gouudWhite, fontSize: 12),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ))),
        ],
      ),
    );
  }
}

class ToggleButton extends StatefulWidget {
  @override
  _ToggleButtonState createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<ToggleButton> {
  List<bool> isSelected = [false, false];
  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: EdgeInsets.only(bottom: 20),
      child: Row(
        children: <Widget>[
          Expanded(
              child: Container(
                  height: 40,
                  decoration: new BoxDecoration(
                    color: gouudWhite,
                    boxShadow: [
                      BoxShadow(color: gouudAppColor, spreadRadius: 2)
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  ),
                  child: LayoutBuilder(builder: (context, constraints) {
                    return ToggleButtons(
                      renderBorder: false,
                      constraints: BoxConstraints.expand(
                          width: constraints.maxWidth / 2),
                      borderRadius: BorderRadius.all(Radius.circular(25.0)),
                      fillColor: gouudAppColor,
                      selectedColor: gouudWhite,
                      textStyle: TextStyle(
                        fontSize: 10,
                      ),
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(7),
                          child: Text(
                            'Curent',
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(7),
                          child: Text(
                            'Previous',
                          ),
                        ),
                      ],
                      onPressed: (int index) {
                        setState(() {
                          for (int buttonIndex = 0;
                              buttonIndex < isSelected.length;
                              buttonIndex++) {
                            if (buttonIndex == index) {
                              isSelected[buttonIndex] = true;
                            } else {
                              isSelected[buttonIndex] = false;
                            }
                          }
                        });
                      },
                      isSelected: isSelected,
                    );
                  })))
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
