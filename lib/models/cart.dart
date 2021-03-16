import 'dart:collection';
import 'package:flutter/widgets.dart';

class Cart {
  final String id;
  final String title;
  final int number;
  final num price;
  final String imgUrl;

  Cart({
    @required this.id,
    @required this.title,
    @required this.number,
    @required this.price,
    @required this.imgUrl,
  });
}

class CartDataProvider with ChangeNotifier {
  Map<String, Cart> _cartitems = {};

  UnmodifiableMapView<String, Cart> get cartItems =>
      UnmodifiableMapView(_cartitems);

  int get cartItemsCount => _cartitems.length;

  double get totalAmount {
    var total = 0.0;
    _cartitems.forEach((key, value) {
      total += value.price * value.number;
    });

    return total;
  }

  void addItem({productId, price, title, imgUrl}) {
    if (_cartitems.containsKey(productId)) {
      _cartitems.update(
          productId,
          (ex) => Cart(
              id: ex.id,
              title: ex.title,
              price: ex.price,
              imgUrl: ex.imgUrl,
              number: ex.number + 1));
    } else {
      _cartitems.putIfAbsent(
          productId,
          () => Cart(
              id: '${DateTime.now()}',
              title: title,
              price: price,
              imgUrl: imgUrl,
              number: 1));
    }
    notifyListeners();
  }

  void deleteItem(String productId) {
    _cartitems.remove(productId);
    notifyListeners();
  }

//update basket +1
  void updateItemAddOne(String productId) {
    _cartitems.update(
        productId,
        (ex) => Cart(
            id: ex.id,
            title: ex.title,
            price: ex.price,
            imgUrl: ex.imgUrl,
            number: ex.number + 1));
    notifyListeners();
  }

//update basket -1
  void updateItemSubOne(String productId) {
    if (_cartitems[productId].number < 2) {
      deleteItem(productId);
    } else {
      _cartitems.update(
          productId,
          (ex) => Cart(
              id: ex.id,
              title: ex.title,
              price: ex.price,
              imgUrl: ex.imgUrl,
              number: ex.number - 1));
    }
    notifyListeners();
  }

  void clear() {
    _cartitems = {};
    notifyListeners();
  }
}
