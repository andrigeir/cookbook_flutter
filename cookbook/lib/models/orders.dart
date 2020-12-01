import 'dart:convert';

import 'package:flutter/material.dart';
import 'cart.dart';
import 'package:http/http.dart' as http;

class OrderItem {
  final String orderId;
  final int amount;
  final List<CartItem> products;
  final DateTime dateTime;

  OrderItem({
    @required this.orderId,
    @required this.amount,
    @required this.products,
    @required this.dateTime,
  });
}

class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    return [..._orders];
  }

  Future<void> addOrder(List<CartItem> cartProducts, int totalAmount) async {
    String url =
        "https://cookbook-firebase-with-flutter.firebaseio.com/orders.json";
    final timestamp = DateTime.now();
    http.post(
      url,
      body: json.encode({
        'amount': totalAmount,
        'dateTime': timestamp.toIso8601String(),
        'products': cartProducts
            .map((cp) => {
                  'id': cp.id,
                  'title': cp.title,
                  'type': cp.type
                      .toString()
                      .substring(cp.type.toString().indexOf(".") + 1)
                      .toUpperCase(),
                  'size': cp.size
                      .toString()
                      .substring(cp.size.toString().indexOf(".") + 1),
                  'quantity': cp.quantity,
                  'price': cp.price,
                  'candy': cp.candy
                })
            .toList(),
      }),
    );

    _orders.insert(
      0,
      OrderItem(
        orderId: DateTime.now().toString(),
        amount: totalAmount,
        products: cartProducts,
        dateTime: DateTime.now(),
      ),
    );
    notifyListeners();
  }
}
