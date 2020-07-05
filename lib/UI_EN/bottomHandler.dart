import 'package:flutter/material.dart';
import 'package:gouud/UI_EN/Favourite.dart';
import 'package:gouud/UI_EN/Home.dart';
import 'package:gouud/UI_EN/SignUp.dart';
import 'package:gouud/profile/view/Profile.dart';
import 'package:gouud/sections/view/Sections.dart';
import 'package:gouud/UI_EN/constants/gouudColors.dart';

class BottomHandler extends StatefulWidget {
  static const id = 'BottomHandler';

  BottomHandler({Key key}) : super(key: key);

  @override
  _BottomHandlerState createState() => _BottomHandlerState();
}

class _BottomHandlerState extends State<BottomHandler> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    Sections(),
    Home(),
    Favourite(),
    SignUp(),
    Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0)),
            child: new Theme(
              data: Theme.of(context).copyWith(
                // sets the background color of the `BottomNavigationBar`
                canvasColor: gouudAppColor,
                // sets the active color of the `BottomNavigationBar` if `Brightness` is light
                primaryColor: Colors.red,
              ),
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                backgroundColor: gouudAppColor,
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.widgets,
                    ),
                    title: Text('Sections'),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    title: Text('Home'),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.favorite_border),
                    title: Text('Favourite'),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.local_offer),
                    title: Text('Offer'),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person_outline),
                    title: Text('Profile'),
                  ),
                ],
                currentIndex: _selectedIndex,
                selectedItemColor: gouudBackgroundColor,
                iconSize: 25,
                onTap: _onItemTapped,
                showSelectedLabels: true,
                showUnselectedLabels: true,
                unselectedItemColor: gouudWhite,
              ),
            )));
  }
}
