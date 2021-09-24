import 'package:flutter/material.dart';
import 'package:gouud/favourite/view/Favourite.dart';
import 'package:gouud/home/view/Home.dart';
import 'package:gouud/UI_EN/constants/custom-widget.dart';
import 'package:gouud/offers/view/Offers.dart';
import 'package:gouud/profile/view/Profile.dart';
import 'package:gouud/sections/view/Sections.dart';
import 'package:gouud/UI_EN/constants/gouudColors.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class BottomHandler extends StatefulWidget {
  static const id = 'BottomHandler';
  @override
  _BottomHandlerState createState() => _BottomHandlerState();
}

class _BottomHandlerState extends State<BottomHandler> {
  PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  List<Widget> _buildScreens() {
    return [
      Home(),
      Sections(),
      Favourite(),
      Offers(),
      Profile(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home),
        title: ("HOME"),
        activeColor: gouudAppColor,
        inactiveColor: gouudWhite,
        // isTranslucent: true,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.widgets),
        title: ("SECTIONS"),
        activeColor: gouudAppColor,
        inactiveColor: gouudWhite,
        // isTranslucent: true,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.favorite_border),
        title: ("FAVOURITE"),
        // contentPadding: 100,
        activeColor: gouudAppColor,
        inactiveColor: gouudWhite,
        // isTranslucent: true,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.local_offer),
        title: ("OFFER"),
        activeColor: gouudAppColor,
        inactiveColor: gouudWhite,
        // isTranslucent: true,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.person_outline),
        title: ("ACCOUNT"),
        activeColor: gouudAppColor,
        inactiveColor: gouudWhite,
        // isTranslucent: true,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
        // navBarCurve: NavBarCurve.upperCorners,
        // navBarCurveRadius: 30,
        controller: _controller,
        screens: _buildScreens(),
        items:
            _navBarsItems(), // Redundant here but defined to demonstrate for other than custom style
        confineInSafeArea: false,
        backgroundColor: Colors.black12,
        handleAndroidBackButtonPress: true,
        onItemSelected: (int) {
          setState(
              () {}); // This is required to update the nav bar if Android back button is pressed
        },
        customWidget: CustomNavBarWidget(
          items: _navBarsItems(),
          onItemSelected: (index) {
            setState(() {
              _controller.index = index; // THIS IS CRITICAL!! Don't miss it!
            });
          },
          selectedIndex: _controller.index,
        ),
        itemCount: 5,
        navBarStyle:
            NavBarStyle.style6 // Choose the nav bar style with this property
        );
  }
}
