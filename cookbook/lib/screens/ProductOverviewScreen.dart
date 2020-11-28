import 'package:cookbook/widgets/bars/menubar.dart';
import 'package:cookbook/widgets/bars/topbar.dart';
import 'package:flutter/material.dart';

import '../widgets/grids/ProductsGrid.dart';
import '../widgets/items/ProductItem.dart';
import '../widgets/bars/topbar.dart';
import '../widgets/bars/menubar.dart';

class ProductOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Builder(
        builder: (context) => new Scaffold(
              backgroundColor: Theme.of(context).primaryColor,
              appBar: TopBar(),
              body: ProductGrid(),
              bottomNavigationBar: MenuBar(),
            ));
  }
}
