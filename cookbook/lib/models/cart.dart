import '../models/product.dart';
import 'package:flutter/material.dart';

class CartItem {
  String id;
  String title;
  IceType iceType;
  IceSize size;
  int quantity;
  int price;
  List<String> nammi;

  CartItem({
    @required this.id,
    @required this.title,
    @required this.iceType,
    @required this.size,
    @required this.price,
    @required this.quantity,
    @required this.nammi,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {
    'p12': CartItem(
      id: 'p1',
      title: 'Bragdarefur',
      size: IceSize.kids,
      iceType: IceType.milkbased,
      price: 1000,
      nammi: ['Oreo', 'Jarðaber'],
      quantity: 2,
    )
  };

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get totalAmount {
    var total = 0;
    _items.forEach((key, cartItem) {
      total = cartItem.price * cartItem.quantity;
    });
    return total;
  }

  void addItem(
    String id,
    String title,
    IceType iceType,
    IceSize size,
    int quantity,
    int price,
    List<String> nammi,
  ) {
    if (_items.containsKey('$id${size.toString()}$price${nammi.join()}') &&
        _items.length > 0) {
      _items.update(
          '$id${size.toString()}$price${nammi.join()}',
          (existingProduct) => CartItem(
                id: existingProduct.id,
                title: existingProduct.title,
                size: existingProduct.size,
                iceType: existingProduct.iceType,
                price: existingProduct.price,
                quantity: existingProduct.quantity + quantity,
                nammi: existingProduct.nammi,
              ));
    } else {
      _items.putIfAbsent(
        '$id${size.toString()}$price${nammi.join()}',
        () => CartItem(
          id: id,
          title: title,
          iceType: iceType,
          size: size,
          price: price,
          quantity: quantity,
          nammi: nammi,
        ),
      );
    }
    notifyListeners();
  }

  void removeItem(String id) {
    _items.remove(id);
    notifyListeners();
  }

  void increaseQuantity(String id) {
    _items.update(
        '$id',
        (existingProduct) => CartItem(
              id: existingProduct.id,
              title: existingProduct.title,
              size: existingProduct.size,
              iceType: existingProduct.iceType,
              price: existingProduct.price,
              quantity: existingProduct.quantity + 1,
              nammi: existingProduct.nammi,
            ));
    notifyListeners();
  }

  void decreaseQuantity(String id) {
    _items.update(
        '$id',
        (existingProduct) => CartItem(
              id: existingProduct.id,
              title: existingProduct.title,
              size: existingProduct.size,
              iceType: existingProduct.iceType,
              price: existingProduct.price,
              quantity: existingProduct.quantity - 1,
              nammi: existingProduct.nammi,
            ));
    notifyListeners();
  }

  void clearCart() {
    _items = {};
    notifyListeners();
  }
}
