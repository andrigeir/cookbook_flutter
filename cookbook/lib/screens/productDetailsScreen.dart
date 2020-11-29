import 'package:cookbook/models/product.dart';
import 'package:provider/provider.dart';
import 'package:cookbook/screens/cart_screen.dart';
import 'package:cookbook/widgets/items/cart_bottom_boarder.dart';
import 'package:flutter/material.dart';
import '../widgets/bars/topbar.dart';
import '../widgets/grids/ToggleButtonGrid.dart';
import '../models/cart.dart';
import 'package:badges/badges.dart';

class ProductDetailsScreen extends StatelessWidget {
  static const routeName = "/product-detail";

  @override
  Widget build(BuildContext context) {
    final Product loadedProduct = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: TopBar(),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                AppBar(
                  title: Text(
                    loadedProduct.title,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  centerTitle: true,
                  elevation: 0,
                  actions: [
                    Stack(alignment: Alignment.topRight, children: <Widget>[
                      IconButton(
                        iconSize: 50,
                        icon: Icon(Icons.shopping_cart),
                        onPressed: () {
                          Navigator.of(context)
                              .pushReplacementNamed(CartScreen.routeName);
                        },
                      ),
                      Chip(
                        label: Consumer<Cart>(
                            builder: (context, cart, child) =>
                                Text(cart.items.length.toString())),
                      )
                    ])
                  ],
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      'Please choose the size of your ice-cream',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                ),
                MyToggleButton(
                  horizontalScroll: true,
                  titles: CartItem().mapSize.keys.toList(),
                  method: 1,
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
                  titles: CartItem().mapType.keys.toList(),
                  method: 2,
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
                  titles: CartItem().mapSize.keys.toList(),
                  method: 3,
                )
              ],
            ),
          ),
          CartBottomBorder(loadedProduct: loadedProduct)
        ],
      ),
    );
  }
}
