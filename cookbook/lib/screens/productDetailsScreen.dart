import 'package:cookbook/models/product.dart';
import 'package:flutter/material.dart';
import '../widgets/bars/topbar.dart';
import '../widgets/grids/ToggleButtonGrid.dart';

class ProductDetailsScreen extends StatelessWidget {
  static const routeName = "/product-detail";

  @override
  Widget build(BuildContext context) {
    final Product loadedProduct = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: TopBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppBar(
              title: Text(
                loadedProduct.title,
                style: Theme.of(context).textTheme.headline4,
              ),
              centerTitle: true,
              elevation: 0,
            ),
            Container(
              margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.025,
                  right: MediaQuery.of(context).size.width * 0.025),
              color: Theme.of(context).accentColor,
              height: 1,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width * 0.95,
                    child: new Image.asset(
                      loadedProduct.imageUrl,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
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
    );
  }
}
