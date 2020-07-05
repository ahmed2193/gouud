import 'package:flutter/material.dart';
import 'package:gouud/UI_EN/constants/gouudColors.dart';
import 'package:gouud/UI_EN/constants/BarContent.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class OrderDetails extends StatefulWidget {
  static const id = 'OrderDetails';
  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  var rating = 3.0;

  String page;
  @override
  void initState() {
    super.initState();
    page = OrderDetails.id;
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
                      image:
                          new AssetImage("assets/icons/screen-background.png"),
                      fit: BoxFit.cover)),
            ),
            ListView(
                padding:
                    EdgeInsets.only(bottom: 70, left: 20, right: 20, top: 100),
                children: <Widget>[new CardItemSection()]),
          ]),
        ),
        bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
          child: ButtonTheme(
            height: 60,
            child: RaisedButton(
                onPressed: () {},
                color: gouudAppColor,
                textColor: gouudWhite,
                child: GestureDetector(
                    onTap: () {
                      showDialog(context: context, builder: cancelDialog);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Manage My Order',
                          style: TextStyle(color: gouudWhite, fontSize: 14),
                        ),
                      ],
                    ))),
          ),
        ));
  }

  Widget bar() {
    return PreferredSize(
        preferredSize: const Size(double.infinity, 250),
        child: UpperBar(_scaffoldKey));
  }

  Dialog ratingDialog = Dialog(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0)), //this right here
    backgroundColor: gouudBackgroundColor,
    child: Container(
      height: 200.0,
      width: 300.0,
      child: Padding(
        padding: EdgeInsets.only(right: 20, left: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              "ADD A RATING",
              style: TextStyle(fontSize: 14, color: gouudWhite),
            ),
            Center(
                child: SmoothStarRating(
              rating: 3,
              isReadOnly: false,
              size: 30,
              color: gouudAppColor,
              borderColor: gouudWhite,
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
            TextField(
              // controller: messageController,
              minLines: 1,
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
            ),
            Container(
              height: 35,
              margin: EdgeInsets.only(right: 30, left: 30),
              decoration: new BoxDecoration(
                color: gouudAppColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(25.0),
                ),
              ),
              child: Center(
                child: Text(
                  'ADDITION',
                  style: TextStyle(color: gouudWhite, fontSize: 12),
                  textAlign: TextAlign.start,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );

  Dialog cancelDialog(BuildContext context) {
    return Dialog(
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
                Icons.cancel,
                color: Colors.red[300],
                size: 70,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Center(
                      child: Text(
                        "Do you want  to cancel a request ?",
                        style: TextStyle(color: gouudWhite, fontSize: 12),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context, true);
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      ratingDialog);
                            },
                            child: Container(
                              height: 35,
                              decoration: new BoxDecoration(
                                color: gouudBackgroundColor,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(25.0),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  'Confirm',
                                  style: TextStyle(
                                      color: gouudWhite, fontSize: 12),
                                  textAlign: TextAlign.start,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Container(
                            height: 35,
                            decoration: new BoxDecoration(
                              color: gouudBackgroundColor,
                              borderRadius: BorderRadius.all(
                                Radius.circular(25.0),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'Cancel',
                                style:
                                    TextStyle(color: gouudWhite, fontSize: 12),
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardItemSection extends StatefulWidget {
  @override
  _CardItemSectionState createState() => _CardItemSectionState();
}

class _CardItemSectionState extends State<CardItemSection> {
  var rating = 3.0;
  @override
  Widget build(BuildContext context) {
    return Card(
        color: gouudAppColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: gouudWhite, width: .5),
        ),
        borderOnForeground: true,
        child: Column(
          children: <Widget>[
            Container(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Order Number',
                          style: TextStyle(fontSize: 12, color: gouudWhite),
                        ),
                        Text('#123456',
                            style: TextStyle(fontSize: 12, color: gouudWhite)),
                      ]),
                ),
                decoration: new BoxDecoration(
                  border: Border(
                    top: BorderSide(color: gouudWhite, width: .5),
                  ),
                )),
            Container(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Date',
                          style: TextStyle(fontSize: 12, color: gouudWhite),
                        ),
                        Text('1/7/2020',
                            style: TextStyle(fontSize: 12, color: gouudWhite)),
                      ]),
                ),
                decoration: new BoxDecoration(
                  border: Border(
                    top: BorderSide(color: gouudWhite, width: .5),
                  ),
                )),
            Container(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            'Order Details',
                            style: TextStyle(fontSize: 12, color: gouudWhite),
                          ),
                        ),
                        Expanded(
                          child: new Center(
                            child: GridView.count(
                              shrinkWrap: true,
                              crossAxisCount: 1,
                              childAspectRatio: 8,
                              padding: EdgeInsets.only(left: 0, right: 10),
                              mainAxisSpacing: 10,
                              children: List.generate(3, (index) {
                                return Text('2 x AQUAA Water blah blah blah ',
                                    style: TextStyle(
                                        fontSize: 12, color: gouudWhite));
                              }),
                            ),
                          ),
                        ),
                      ]),
                ),
                decoration: new BoxDecoration(
                  border: Border(
                    top: BorderSide(color: gouudWhite, width: .5),
                  ),
                )),
            Container(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'YEAR',
                          style: TextStyle(fontSize: 12, color: gouudWhite),
                        ),
                        Text('2020',
                            style: TextStyle(fontSize: 12, color: gouudWhite)),
                      ]),
                ),
                decoration: new BoxDecoration(
                  border: Border(
                    top: BorderSide(color: gouudWhite, width: .5),
                  ),
                )),
            Container(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'DESCRIPTION',
                          style: TextStyle(fontSize: 12, color: gouudWhite),
                        ),
                        Flexible(
                            child: Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                              'changed in this State, which causes it to rerun the build method ... Be Add to the wallet but problem is that we Need to refresh the app',
                              style: TextStyle(fontSize: 10, color: gouudWhite),
                              textAlign: TextAlign.left),
                        ))
                      ]),
                ),
                decoration: new BoxDecoration(
                  border: Border(
                    top: BorderSide(color: gouudWhite, width: .5),
                  ),
                )),
          ],
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
