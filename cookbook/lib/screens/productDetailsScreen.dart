import 'package:cookbook/models/product.dart';
import 'package:flutter/material.dart';
import '../widgets/bars/topbar.dart';

class ProductDetailsScreen extends StatelessWidget {
  static const routeName = "/product-detail";

  @override
  Widget build(BuildContext context) {
    final Product loadedProduct = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: TopBar(),
      body: Column(
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
        ],
      ),
    );
  }
}
