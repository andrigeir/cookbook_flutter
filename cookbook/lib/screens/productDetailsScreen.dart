import 'package:flutter/material.dart';
import '../widgets/bars/topbar.dart';

class ProductDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: TopBar(),
      body: Column(
        children: [
          AppBar(
            title: Text(
              "Product Detail",
              style: Theme.of(context).textTheme.headline4,
            ),
            centerTitle: true,
            elevation: 0,
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
                    "assets/storm.jpg",
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
