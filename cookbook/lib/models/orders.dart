import 'package:flutter/material.dart';
import 'cart.dart';

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

  void addOrder(List<CartItem> cartProducts, int totalAmount) {
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
