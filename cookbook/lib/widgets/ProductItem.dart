import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final String path;

  ProductItem(this.path);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      height: 150,
      width: 150,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(path), fit: BoxFit.cover),
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
    );
  }
}
