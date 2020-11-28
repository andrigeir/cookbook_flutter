import 'package:flutter/material.dart';

import '../../models/products.dart';
import '../items/ProductItem.dart';

class ProductGrid extends StatelessWidget {
  final products = Products().items;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        color: Theme.of(context).primaryColor,
        child: CustomScrollView(slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Center(
                  child: Container(
                    margin: EdgeInsets.all(8),
                    height: 150,
                    width: 150,
                    child: Image.asset('assets/Icecream_logo.png'),
                  ),
                ),
              ],
            ),
          ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, i) =>
                  ProductItem(products[i].imageUrl, products[i].title),
              childCount: products.length,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 5 / 6,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
          ),
        ]));
  }
}
