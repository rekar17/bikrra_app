import 'dart:convert';

class ProductC {
  final String image;
  final String name;
  final String description;
  final String category;
  final int price;
  bool? isFavorite;
  int? quantity;

  ProductC({
    required this.image,
    required this.name,
    required this.description,
    required this.category,
    required this.price,
    this.isFavorite = false,
    this.quantity = 1,
  });

  //fromMap
  factory ProductC.fromMap(Map<String, dynamic> map) {
    return ProductC(
      image: map['image'],
      name: map['name'],
      description: map['description'],
      category: map['category'],
      price: map['price'],
      isFavorite: map['isFavorite'],
      quantity: map['quantity'],
    );
  }

  //toMap
  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'name': name,
      'description': description,
      'category': category,
      'price': price,
      'isFavorite': isFavorite,
      'quantity': quantity,
    };
  }

  //toJson
  String toJson() => json.encode(toMap());

  //fromJson

  factory ProductC.fromJson(String source) =>
      ProductC.fromMap(json.decode(source));
}
