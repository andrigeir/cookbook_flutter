import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ToggleButtonItem extends StatelessWidget {
  final Color color;
  final String title;

  ToggleButtonItem(this.title, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      child: FloatingActionButton.extended(
        heroTag: null,
        onPressed: null,
        label: Text(title),
        backgroundColor: color,
      ),
    );
  }
}
