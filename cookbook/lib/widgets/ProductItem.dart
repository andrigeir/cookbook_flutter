import 'package:cookbook/screens/productDetailsScreen.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final String imagePath;
  final String title;

  ProductItem(this.imagePath, this.title);

  void selectProduct(BuildContext ctx) {
    Navigator.of(ctx).push(
      MaterialPageRoute(
        builder: (_) {
          return ProductDetailsScreen(title, imagePath);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: GridTile(
        child: GestureDetector(
          onTap: () => selectProduct(context),
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Theme.of(context).primaryColor.withOpacity(0.8),
          title: Text(
            title,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
