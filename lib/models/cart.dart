import 'dart:collection';
import 'package:flutter/cupertino.dart';

// Cart Model
class Cart {
  final String id;
  final String name;
  final int number;
  final num price;
  final String image;

  Cart({
    required this.id,
    required this.name,
    required this.number,
    required this.price,
    required this.image});
}

// Cart Provider
class CartDataProvider with ChangeNotifier {
  Map<String, Cart> _cartItems = {};

  UnmodifiableMapView<String, Cart> get cartItems =>
      UnmodifiableMapView(_cartItems);

  int get cartItemsCount => _cartItems.length;

  double get totalAmount {
    var total = 0.0;
    _cartItems.forEach((key, item) {
      total += item.price * item.number;
    });

    return total;
  }

  void addItem({productId, price, name, image}) {
    if (_cartItems.containsKey(productId)) {
      _cartItems.update(productId, (ex) => Cart(
        id: ex.id,
        name: ex.name,
        price: ex.price,
        image: ex.image,
        number: ex.number + 1,
      ));
    } else {
      _cartItems.putIfAbsent(productId, () => Cart(
        id: '${DateTime.now()}',
        name: name,
        price: price,
        image: image,
        number: 1,
      ));
    }
    notifyListeners();
  }

  void deleteItem(String productId) {
    _cartItems.remove(productId);
    notifyListeners();
  }

  // Обновить корзину на +1 единицу товара по id
  void updateItemsAddOne(String productId) {
    _cartItems.update(
      productId,
          (ex) => Cart(
        id: ex.id,
        name: ex.name,
        price: ex.price,
        image: ex.image,
        number: ex.number + 1,
      ),
    );
    notifyListeners();
  }

  // Обновить корзину на -1 единицу товара по id
  void updateItemsSubOne(String productId) {
    if (_cartItems[productId]!.number < 2) {
      deleteItem(productId);
    } else {
      _cartItems.update(
        productId,
            (ex) => Cart(
          id: ex.id,
          name: ex.name,
          price: ex.price,
          image: ex.image,
          number: ex.number - 1,
        ),
      );
    }
    notifyListeners();
  }

  void clear() {
    _cartItems = {};
    notifyListeners();
  }
}