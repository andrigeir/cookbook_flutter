import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final String path;
  final String title;

  ProductItem(this.path, this.title);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      margin: EdgeInsets.all(8),
      height: 200,
      width: 150,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(path),
          fit: BoxFit.cover,
        ),
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        title,
        style: Theme.of(context).textTheme.button,
      ),
    );
  }
}
