import 'package:flutter/material.dart';
import '../widgets/bars/topbar.dart';

class ProductDetailsScreen extends StatelessWidget {
  final String productTitle;
  final String productImage;

  ProductDetailsScreen(this.productTitle, this.productImage);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: TopBar(),
      body: Column(
        children: [
          AppBar(
            title: Text(
              productTitle,
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
                    productImage,
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
