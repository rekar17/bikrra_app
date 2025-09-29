import 'package:bikrra_app/classes/product.class.dart';

class GiftItem {
  final String name;
  final String imagePath;
  final double price;
  final String category;

  GiftItem({
    required this.name,
    required this.imagePath,
    required this.price,
    required this.category,
  });

  GiftItem copyWith({
    String? name,
    String? imagePath,
    double? price,
    String? category,
  }) {
    return GiftItem(
      name: name ?? this.name,
      imagePath: imagePath ?? this.imagePath,
      price: price ?? this.price,
      category: category ?? this.category,
    );
  }
}

class GiftList {
  final String coupleName;
  final DateTime eventDate;
  final String venue;
  final String image;
  final List<ProductC> items;

  GiftList(
      {required this.coupleName,
      required this.eventDate,
      required this.venue,
      required this.image,
      required this.items});
}
