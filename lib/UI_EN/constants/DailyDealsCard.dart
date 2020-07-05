import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gouud/UI_EN/constants/gouudColors.dart';

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
