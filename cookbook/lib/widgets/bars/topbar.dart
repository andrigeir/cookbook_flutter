import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(15);
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _getTopBar(context, 50));
  }
}

//Method to get the top bar
_getTopBar(context, double height) {
  return PreferredSize(
    preferredSize: Size.fromHeight(height),
    child: Container(
      child: Row(
        children: _getStripes(context, 20),
      ),
    ),
  );
}

//helper method to generate stripes. Starting with red and ending in red.
List<Widget> _getStripes(context, double height) {
  List<Widget> stripes = [];
  for (var i = 0; i < 10; i++) {
    stripes.add(Expanded(
      flex: 1, // 20%
      child: Container(color: Theme.of(context).accentColor),
    ));
    stripes.add(Expanded(
      flex: 1, // 60%
      child: Container(color: Theme.of(context).primaryColor),
    ));
  }

  stripes.add(Expanded(
    flex: 1, // 20%
    child: Container(color: Theme.of(context).accentColor),
  ));
  return stripes;
}
