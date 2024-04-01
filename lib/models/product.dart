import 'dart:collection';

import 'package:flutter/cupertino.dart';

class Product with ChangeNotifier {
  final String id;
  final String image;
  final String name;
  final int size;
  final String color;
  final num price;

  Product({
    required this.id,
    required this.image,
    required this.name,
    required this.size,
    required this.color,
    required this.price,
  });

  factory Product.fromMap(Map<String, dynamic> json) => Product(
        id: json['id'],
        image: json['image'],
        name: json['name'],
        size: json['size'],
        color: json['color'],
        price: json['price'],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "image": image,
        "name": name,
        "size": size,
        "color": color,
        "price": price,
      };
}

class ProductDataProvider with ChangeNotifier {
  List<Product> _productShoes = [
    Product(
        id: 'p1',
        image: 'assets/images/wom1.jpg',
        name: 'Ботинки',
        size: 38,
        color: 'Черный',
        price: 1299),
    Product(
        id: 'p1',
        image: 'assets/images/wom1.jpg',
        name: 'Туфли',
        size: 39,
        color: 'Белый',
        price: 999),
    Product(
        id: 'p1',
        image: 'assets/images/wom1.jpg',
        name: 'Кеды',
        size: 38,
        color: 'Красный',
        price: 1699),
    Product(
        id: 'p1',
        image: 'assets/images/wom1.jpg',
        name: 'Туфли',
        size: 39,
        color: 'Белый',
        price: 999),
    Product(
        id: 'p1',
        image: 'assets/images/wom1.jpg',
        name: 'Кеды',
        size: 38,
        color: 'Красный',
        price: 1699),
    Product(
        id: 'p1',
        image: 'assets/images/wom1.jpg',
        name: 'Ботинки',
        size: 38,
        color: 'Черный',
        price: 1299),
    Product(
        id: 'p1',
        image: 'assets/images/wom1.jpg',
        name: 'Туфли',
        size: 39,
        color: 'Белый',
        price: 999),
    Product(
        id: 'p1',
        image: 'assets/images/wom1.jpg',
        name: 'Кеды',
        size: 38,
        color: 'Красный',
        price: 1699),
    Product(
        id: 'p1',
        image: 'assets/images/wom1.jpg',
        name: 'Туфли',
        size: 39,
        color: 'Белый',
        price: 999),
    Product(
        id: 'p1',
        image: 'assets/images/wom1.jpg',
        name: 'Кеды',
        size: 38,
        color: 'Красный',
        price: 1699),
    Product(
        id: 'p1',
        image: 'assets/images/wom1.jpg',
        name: 'Ботинки',
        size: 38,
        color: 'Черный',
        price: 1299),
    Product(
        id: 'p1',
        image: 'assets/images/wom1.jpg',
        name: 'Туфли',
        size: 39,
        color: 'Белый',
        price: 999),
    Product(
        id: 'p1',
        image: 'assets/images/wom1.jpg',
        name: 'Кеды',
        size: 38,
        color: 'Красный',
        price: 1699),
    Product(
        id: 'p1',
        image: 'assets/images/wom1.jpg',
        name: 'Туфли',
        size: 39,
        color: 'Белый',
        price: 999),
    Product(
        id: 'p1',
        image: 'assets/images/wom1.jpg',
        name: 'Кеды',
        size: 38,
        color: 'Красный',
        price: 1699),
  ];

  UnmodifiableListView<Product> get productShoes =>
      UnmodifiableListView(_productShoes);

  Product getElementById(String id) =>
      _productShoes.singleWhere((value) => value.id == id);
}
