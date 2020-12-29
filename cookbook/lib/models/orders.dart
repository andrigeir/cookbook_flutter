import 'dart:convert';
import 'package:flutter/material.dart';
import 'cart.dart';
import 'package:http/http.dart' as http;
import 'product.dart';

class OrderItem {
  final String orderId;
  final int amount;
  final List<CartItem> products;
  final DateTime dateTime;
  final String delivery;
  final String adress;
  final String payment;

  OrderItem({
    @required this.orderId,
    @required this.amount,
    @required this.products,
    @required this.dateTime,
    @required this.delivery,
    @required this.adress,
    @required this.payment,
  });
}

class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];
  final String authToken;
  final String userId;

  Orders(this.authToken, this.userId, this._orders);

  List<OrderItem> get orders {
    return [..._orders];
  }

  Future<void> addOrder(List<CartItem> cartProducts, int totalAmount,
      String delivery, String adress, String payment) async {
    final url =
        "https://cookbook-firebase-with-flutter.firebaseio.com/orders/$userId.json?auth=$authToken";
    final timestamp = DateTime.now();
    final response = await http.post(
      url,
      body: json.encode({
        'amount': totalAmount,
        'dateTime': timestamp.toIso8601String(),
        'delivery': delivery,
        'adress': adress,
        'payment': payment,
        'products': cartProducts
            .map((cp) => {
                  'id': cp.id,
                  'title': cp.title,
                  'type': cp.type
                      .toString()
                      .substring(cp.type.toString().indexOf(".") + 1),
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
          orderId: json.decode(response.body)['name'],
          amount: totalAmount,
          products: cartProducts,
          dateTime: DateTime.now(),
          delivery: delivery,
          adress: adress,
          payment: payment),
    );
    notifyListeners();
  }

  Future<void> fetchAndSetOrders() async {
    final url =
        "https://cookbook-firebase-with-flutter.firebaseio.com/orders/$userId.json?auth=$authToken";
    final response = await http.get(url);
    final List<OrderItem> loadedOrders = [];
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    if (extractedData == null) {
      return;
    }

    extractedData.forEach((id, orderData) {
      loadedOrders.add(
        OrderItem(
          orderId: id,
          amount: orderData["amount"],
          dateTime: DateTime.parse(orderData["dateTime"]),
          delivery: orderData["delivery"],
          adress: orderData["adress"],
          payment: orderData["payment"],
          products: (orderData['products'] as List<dynamic>)
              .map(
                (item) => CartItem(
                  id: item['id'],
                  title: item['title'],
                  type: mapType[item['type']],
                  size: mapSize[item['size']],
                  price: item['price'],
                  quantity: item['quantity'],
                  candy: (item['candy'] as List<dynamic>)
                      .map((e) => e.toString())
                      .toList(),
                ),
              )
              .toList(),
        ),
      );
    });
    _orders = loadedOrders;
    notifyListeners();
  }
}

Map<String, IceSize> mapSize = {
  "Barna": IceSize.kids,
  "Lítill": IceSize.small,
  "Miðlungs": IceSize.medium,
  "Stór": IceSize.large,
};

Map<String, IceType> mapType = {
  "Gamli": IceType.milkbased,
  "Nýji": IceType.creambased,
  "Vegan": IceType.vegan
};
