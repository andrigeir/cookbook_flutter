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
  static const List<String> _pages = <String>[
    CartScreen.routeName,
    ProductOverviewScreen.routeName,
    UserProfile.routeName,
  ];

  static int _currentIndex;

  void _changeTab(int index) {
    setState(() {
      _currentIndex = index;
      Navigator.of(context).pushReplacementNamed(_pages[index]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Karfan mín',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Heim',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_outlined),
            label: 'Mín Síða',
          )
        ],
        currentIndex: _currentIndex,
        onTap: _changeTab,
        selectedItemColor: Colors.black,
        unselectedItemColor: Theme.of(context).primaryColor);
  }
}
