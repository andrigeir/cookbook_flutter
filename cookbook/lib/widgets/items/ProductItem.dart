import '../../models/product.dart';
import 'package:provider/provider.dart';
import 'package:cookbook/screens/productDetailsScreen.dart';
import 'package:flutter/material.dart';

import '../../models/cart.dart';

class ProductItem extends StatelessWidget {
  final Product loadedProduct;

  ProductItem(this.loadedProduct);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Provider.of<CartItem>(context, listen: false)
                .setCartTemp(loadedProduct);
            Navigator.of(context).pushNamed(ProductDetailsScreen.routeName,
                arguments: loadedProduct);
          },
          child: Image.asset(
            loadedProduct.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Theme.of(context).primaryColor.withOpacity(0.8),
          title: Text(
            loadedProduct.title,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
