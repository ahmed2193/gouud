import 'package:flutter/material.dart';
import 'package:gouud/UI_EN/constants/BarContent.dart';
import 'package:gouud/UI_EN/constants/gouudColors.dart';

class PayNow extends StatefulWidget {
  static const id = 'PayNow';
  @override
  _PayNowState createState() => _PayNowState();
}

class _PayNowState extends State<PayNow> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  String page;
  List<String> cards = ['electronic', 'cash', 'bank'];
  List<String> images = [
    'assets/icons/electronic.png',
    'assets/icons/cash.png',
    'assets/icons/bank.png'
  ];
  List<bool> selects;
  @override
  void initState() {
    super.initState();
    page = PayNow.id;
    selects = [false, false, false];
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: bar(),
      key: _scaffoldKey,

      // resizeToAvoidBottomInset: false,

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
          ListView(padding: EdgeInsets.all(20), children: <Widget>[
            new Container(
              child: Text(
                'SELECT PAYMENT METHOD',
                style: TextStyle(color: gouudAppColor, fontSize: 14),
              ),
            ),
            new Container(
              margin: EdgeInsets.only(top: 20),
              height: 180,
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 6,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selects[0] = true;
                          selects[2] = false;
                          selects[1] = false;
                        });
                      },
                      child: PayCards(images[0], cards[0], selects[0]),
                    ),
                  ),
                  Expanded(flex: 1, child: Container()),
                  Expanded(
                    flex: 6,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selects[1] = true;
                          selects[2] = false;
                          selects[0] = false;
                        });
                      },
                      child: PayCards(images[1], cards[1], selects[1]),
                    ),
                  ),
                  Expanded(flex: 1, child: Container()),
                  Expanded(
                    flex: 6,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selects[2] = true;
                          selects[0] = false;
                          selects[1] = false;
                        });
                      },
                      child: PayCards(images[2], cards[2], selects[2]),
                    ),
                  ),
                ],
              ),
            ),
            new Container(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: payMethod('assets/icons/paypal.png'),
                  ),
                  Expanded(
                    child: payMethod('assets/icons/visa.png'),
                  ),
                  Expanded(
                    child: payMethod('assets/icons/master.png'),
                  ),
                  Expanded(
                    child: payMethod('assets/icons/express.png'),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: new Container(
                child: Text(
                  'CARD INFORMATION',
                  style: TextStyle(color: gouudAppColor, fontSize: 14),
                ),
              ),
            ),
            new Container(
              child: Text(
                'Enter card information to complete payment',
                style: TextStyle(color: gouudWhite, fontSize: 10),
              ),
            ),
            cardNumber('  CARD NUMBER', 'assets/icons/visa.png'),
            nameCard(
                'YOUR NAME CARD',
                Icon(
                  Icons.person,
                  color: gouudAppColor,
                )),
            twoInputs(),
          ]),
        ]),
      ),

      bottomNavigationBar: bottomButton(),
    );
  }

  Dialog successDailog = Dialog(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0)), //this right here
    backgroundColor: gouudAppColor,
    child: Container(
      height: 150.0,
      width: 300.0,
      child: Padding(
        padding: EdgeInsets.only(right: 20, left: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Icon(
              Icons.check_circle,
              color: Colors.lightGreenAccent[700],
              size: 70,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "THE REQUEST SENT SUCCESSFULY",
                  style: TextStyle(color: gouudWhite, fontSize: 12),
                  textAlign: TextAlign.start,
                ),
                Text(
                  "Your request has been sent to management with successor. Manage it",
                  style: TextStyle(color: gouudBackgroundColor, fontSize: 8),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );

  Widget bar() {
    return PreferredSize(
        preferredSize: const Size(double.infinity, 250),
        child: UpperBar(_scaffoldKey));
  }

  Widget payMethod(image) {
    return ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Image(image: AssetImage(image), fit: BoxFit.contain),
        ));
  }

  Widget bottomButton() {
    return ClipRRect(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(30.0), topLeft: Radius.circular(30.0)),
        child: ButtonTheme(
          height: 60,
          child: RaisedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) => successDailog);
              },
              color: gouudAppColor,
              textColor: gouudWhite,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Icon(
                      Icons.monetization_on,
                      color: gouudWhite,
                      size: 40,
                    ),
                  ),
                  Text(
                    'PAY NOW',
                    style: TextStyle(color: gouudWhite, fontSize: 14),
                  ),
                ],
              )),
        ));
  }

  Widget cardNumber(label, image) {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: new Container(
        height: 40,
        width: 260,
        child: new TextField(
          cursorColor: gouudAppColor,
          decoration: new InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                const Radius.circular(30.0),
              ),
              borderSide: BorderSide(color: gouudAppColor, width: 2.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: gouudWhite, width: 2.0),
              borderRadius: const BorderRadius.all(
                const Radius.circular(30.0),
              ),
            ),
            filled: true,
            hintStyle: new TextStyle(color: gouudBackgroundColor, fontSize: 12),
            hintText: label.toString(),
            prefixIcon: Padding(
              padding: EdgeInsets.only(left: 5),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    bottomLeft: const Radius.circular(30.0),
                    topLeft: const Radius.circular(30.0)),
                child: Image(
                    image: AssetImage(image), height: 40, fit: BoxFit.contain),
              ),
            ),
            fillColor: gouudWhite,
          ),
        ),
      ),
    );
  }

  Widget nameCard(label, iconType) {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: new Container(
        height: 40,
        width: 260,
        child: new TextField(
          cursorColor: gouudAppColor,
          decoration: new InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  const Radius.circular(30.0),
                ),
                borderSide: BorderSide(color: gouudAppColor, width: 2.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: gouudWhite, width: 2.0),
                borderRadius: const BorderRadius.all(
                  const Radius.circular(30.0),
                ),
              ),
              filled: true,
              hintStyle:
                  new TextStyle(color: gouudBackgroundColor, fontSize: 12),
              hintText: label.toString(),
              prefixIcon: iconType,
              fillColor: gouudWhite),
        ),
      ),
    );
  }

  Widget twoInputs() {
    return new Row(
      children: <Widget>[
        Expanded(
          child: new Padding(
            padding: EdgeInsets.only(right: 10),
            child: nameCard(
              'END DATE',
              Icon(
                Icons.date_range,
                color: gouudAppColor,
                size: 20,
              ),
            ),
          ),
        ),
        Expanded(
          child: new Padding(
            padding: EdgeInsets.only(left: 10),
            child: nameCard(
              'CVV',
              Icon(
                Icons.brightness_1,
                color: gouudAppColor,
                size: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class PayCards extends StatefulWidget {
  final String image;
  final String text;
  final bool select;
  PayCards(this.image, this.text, this.select);
  @override
  _PayCardsState createState() => _PayCardsState();
}

class _PayCardsState extends State<PayCards> {
  @override
  Widget build(BuildContext context) {
    return selected();
  }

  Widget selected() {
    if (widget.select) {
      return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ClipRRect(
                child: Padding(
                    padding: EdgeInsets.all(15),
                    child: ColorFiltered(
                      colorFilter: ColorFilter.mode(
                        gouudBackgroundColor,
                        BlendMode.modulate,
                      ),
                      child: Image(
                          image: AssetImage(widget.image),
                          height: 60,
                          fit: BoxFit.contain),
                    ))),
            Text(
              widget.text,
              style: TextStyle(color: gouudBackgroundColor),
            ),
            Icon(
              Icons.check_box,
              color: gouudBackgroundColor,
            )
          ],
        ),
        decoration: new BoxDecoration(
          color: gouudAppColor,
          boxShadow: [BoxShadow(color: gouudBackgroundColor, spreadRadius: 1)],
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      );
    } else {
      return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ClipRRect(
                child: Padding(
              padding: EdgeInsets.all(15),
              child: Image(
                  image: AssetImage(widget.image),
                  height: 55,
                  fit: BoxFit.contain),
            )),
            Text(
              widget.text,
              style: TextStyle(color: gouudWhite),
            ),
            Icon(
              Icons.check_box_outline_blank,
              color: gouudWhite,
            )
          ],
        ),
        decoration: new BoxDecoration(
          color: gouudBackgroundColor,
          boxShadow: [BoxShadow(color: gouudAppColor, spreadRadius: 1)],
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      );
    }
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
