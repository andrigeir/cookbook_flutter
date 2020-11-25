import 'package:flutter/material.dart';

import '../widgets/bars/menubar.dart';
import '../widgets/bars/topbar.dart';
import '../widgets/grids/ProductsGrid.dart';

class ProductOverviewScreen extends StatelessWidget {
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
