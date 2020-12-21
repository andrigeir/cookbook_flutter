import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../screens/cart_screen.dart';
import '../../screens/ProductOverviewScreen.dart';
import '../../screens/user_profile_screen.dart';

class MenuBar extends StatefulWidget {
  @override
  _MenuBarState createState() => _MenuBarState();
}

class _MenuBarState extends State<MenuBar> {
  List<String> _pages = <String>[
    CartScreen.routeName,
    ProductOverviewScreen.routeName,
    UserProfile.routeName,
  ];

  int _currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      items: [
        BottomNavigationBarItem(
          icon: new Icon(Icons.shopping_cart),
          title: new Text('My Cart'),
        ),
        BottomNavigationBarItem(
          icon: new Icon(Icons.home),
          title: new Text('Home'),
        ),
        BottomNavigationBarItem(
          icon: new Icon(Icons.person),
          title: new Text('Profile'),
        )
      ],
      onTap: (index) {
        setState(() {
          _currentIndex = index;
          Navigator.of(context).pushReplacementNamed(_pages[index]);
        });
      },

    );
  }
}
