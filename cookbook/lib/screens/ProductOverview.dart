import 'package:flutter/material.dart';
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
        body: Column(
          children: <Widget>[
            Column(
              children: <Widget>[
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
            Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    ProductItem('assets/storm.jpg'),
                    ProductItem('assets/iceInABox.jpg')
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    ProductItem('assets/iceInACone.jpg'),
                    ProductItem('assets/shake.jpg')
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    ProductItem('assets/storm.jpg'),
                    ProductItem('assets/iceInABox.jpg')
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
