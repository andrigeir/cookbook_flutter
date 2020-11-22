import 'package:flutter/material.dart';

import '../widgets/grids/ProductsGrid.dart';
import '../widgets/ProductItem.dart';

class ProductOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Builder(
        builder: (context) => new Scaffold(
            backgroundColor: Theme.of(context).primaryColor,
            appBar: AppBar(
              backgroundColor: Theme.of(context).accentColor,
              title: Text(
                'Flutter Cookbook Demo',
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
            body: ProductGrid()));
  }
}
