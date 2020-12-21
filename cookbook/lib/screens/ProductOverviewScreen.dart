import 'package:flutter/material.dart';


import '../widgets/grids/ProductsGrid.dart';
import '../widgets/items/ProductItem.dart';
import '../widgets/bars/topbar.dart';
import '../widgets/bars/menubar.dart';
import '../widgets/bars/topbar.dart';
import '../widgets/grids/ProductsGrid.dart';

class ProductOverviewScreen extends StatelessWidget {
  static const routeName = "/product-overview";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: TopBar(),
      body: ProductGrid(),
      bottomNavigationBar: MenuBar(),
    );
  }
}
