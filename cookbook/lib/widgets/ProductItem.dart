import 'package:cookbook/screens/productDetailsScreen.dart';
import 'package:flutter/material.dart';

void selectProduct(BuildContext ctx) {
  Navigator.of(ctx).push(
    MaterialPageRoute(
      builder: (_) {
        return ProductDetailsScreen();
      },
    ),
  );
}

class ProductItem extends StatelessWidget {
  final String path;
  final String title;

  ProductItem(this.path, this.title);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: GridTile(
        child: GestureDetector(
          onTap: () => selectProduct(context),
          child: Image.asset(
            path,
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
