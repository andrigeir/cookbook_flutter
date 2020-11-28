import 'package:flutter/material.dart';

import '../widgets/bars/topbar.dart';
import '../widgets/product_image_widget.dart';
import '../widgets/bars/back_appbar.dart';
import '../widgets/grids/ToggleButtonGrid.dart';
import '../widgets/cart_bottom_boarder.dart';

class ProductDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: TopBar(),
      body: Stack(alignment: Alignment.bottomCenter, children: [
        SingleChildScrollView(
          child: Column(
            children: <Widget>[
              BackAppBar('Storm'),
              Padding(
                padding: EdgeInsets.all(5),
              ),
              ProductImage('assets/storm.jpg'),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'Please choose size',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
              ),
              MyToggleButton(
                horizontalScroll: true,
                titles: ["Kids", "Small", "Medium", "Large"],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'Please choose the base of your ice-cream',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
              ),
              MyToggleButton(
                horizontalScroll: false,
                titles: ["Milk", "Cream", "Vegan"],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'Please choose your extras',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
              ),
              MyToggleButton(
                horizontalScroll: false,
                titles: [
                  "Mars",
                  "Snickers",
                  "Oreo",
                  "M&M",
                  "Penuts",
                  "Liquirice",
                  "Milka",
                  "Caramel",
                  "Daim"
                ],
              )
            ],
          ),
        ),
        CartBottomBorder(loadedProduct: null)
      ]),
    );
  }
}
