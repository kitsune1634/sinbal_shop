class Product {
  late int id;
  String name = '';
  int size;
  String color = '';
  int price;

  Product(
      {this.id = 0,
        required this.name,
        required this.size,
        required this.color,
        required this.price,
      });

  factory Product.fromMap(Map<String, dynamic> json) => Product(
    id: json['id'],
    name: json['name'],
    size: json['size'],
    color: json['color'],
    price: json['price'],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "size": size,
    "color": color,
    "price": price,
  };
}

Product productShoes = Product(name: "name", size: 1, color: "color", price: 12);


