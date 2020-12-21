import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  final String imagePath;

  ProductImage(this.imagePath);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(40.0),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.3,
        width: MediaQuery.of(context).size.width * 0.9,
        child: new Image.asset(
          imagePath,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
