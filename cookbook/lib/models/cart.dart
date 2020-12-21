import '../models/product.dart';
import 'package:flutter/material.dart';
import './product.dart';

class CartItem with ChangeNotifier {
  String id;
  String title;
  IceType type;
  IceSize size;
  int quantity;
  int price;
  List<String> candy;

  CartItem({
    this.id,
    this.title,
    this.type,
    this.size,
    this.price,
    this.quantity,
    this.candy,
  });
  CartItem _cartTemp;

  void setCartTemp(Product loadedProduct) {
    _cartTemp = CartItem(
      id: loadedProduct.id,
      title: loadedProduct.title,
      type: loadedProduct.type,
      size: loadedProduct.size,
      price: loadedProduct.price,
      candy: loadedProduct.candy,
      quantity: 1,
    );
    notifyListeners();
  }

  int get getPrice {
    return _cartTemp.price;
  }

  CartItem get getCartItem {
    return _cartTemp;
  }

  void setSize(String title) {
    _cartTemp.size = mapSize[title];
    _cartTemp.price = mapPrice[title];
    notifyListeners();
  }

  void setType(String title) {
    _cartTemp.type = mapType[title];
    notifyListeners();
  }

  void addCandy(String candy) {
    _cartTemp.candy.add(candy);
    notifyListeners();
  }

  void removeCandy(String candy) {
    _cartTemp.candy.remove(candy);
    notifyListeners();
  }

  Map<String, IceType> mapType = {
    "Gamli": IceType.milkbased,
    "Nýji": IceType.creambased,
    "Vegan": IceType.vegan
  };

  Map<String, IceSize> mapSize = {
    "Barna": IceSize.kids,
    "Lítill": IceSize.small,
    "Miðlungs": IceSize.medium,
    "Stór": IceSize.large,
  };
  Map<String, int> mapPrice = {
    "Barna": 1000,
    "Lítill": 1200,
    "Miðlungs": 1300,
    "Stór": 1500,
  };
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {
    'p12': CartItem(
      id: 'p1',
      title: 'Bragðarefur',
      size: IceSize.kids,
      type: IceType.milkbased,
      price: 1000,
      candy: ['Oreo', 'Jarðaber'],
      quantity: 2,
    )
  };

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get totalAmount {
    var total = 0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  void addItem(
    String id,
    String title,
    IceType type,
    IceSize size,
    int quantity,
    int price,
    List<String> candy,
  ) {
    if (_items.containsKey('$id${size.toString()}$price${candy.join()}') &&
        _items.length > 0) {
      _items.update(
          '$id${size.toString()}$price${candy.join()}',
          (existingProduct) => CartItem(
                id: existingProduct.id,
                title: existingProduct.title,
                size: existingProduct.size,
                type: existingProduct.type,
                price: existingProduct.price,
                quantity: existingProduct.quantity + quantity,
                candy: existingProduct.candy,
              ));
    } else {
      _items.putIfAbsent(
        '$id${size.toString()}$price${candy.join()}',
        () => CartItem(
          id: id,
          title: title,
          type: type,
          size: size,
          price: price,
          quantity: quantity,
          candy: candy,
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
              type: existingProduct.type,
              price: existingProduct.price,
              quantity: existingProduct.quantity + 1,
              candy: existingProduct.candy,
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
              type: existingProduct.type,
              price: existingProduct.price,
              quantity: existingProduct.quantity - 1,
              candy: existingProduct.candy,
            ));
    notifyListeners();
  }

  void clearCart() {
    _items = {};
    notifyListeners();
  }
}
