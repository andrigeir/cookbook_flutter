import 'package:flutter/material.dart';

class DeliveryItem with ChangeNotifier {
  String delivery = '';
  String adress = '';

  DeliveryItem({
    this.delivery,
    this.adress,
  });
  DeliveryItem _deliveryItem;

  DeliveryItem get getDeliveryItem {
    return _deliveryItem;
  }

  void setDelivery(String _delivery) {
    _deliveryItem = DeliveryItem(delivery: _delivery);
    notifyListeners();
  }

  String get getDelivery {
    return _deliveryItem.delivery;
  }

  void setAdress(String _adress) {
    _deliveryItem.adress = _adress;
    notifyListeners();
  }

  String get getAdress {
    return _deliveryItem.adress;
  }
}
