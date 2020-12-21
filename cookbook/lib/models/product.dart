import 'package:flutter/material.dart';

class Product {
  final String id;
  final String title;
  int price;
  final String imageUrl;
  IceSize size;
  IceType type;
  List<String> candy;

  Product(
      {@required this.id,
      @required this.title,
      @required this.price,
      @required this.imageUrl,
      this.size,
      this.type,
      this.candy});
}

enum IceSize {
  kids,
  small,
  medium,
  large,
}
enum IceType {
  milkbased,
  creambased,
  vegan,
}
