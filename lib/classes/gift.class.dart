class GiftItem {
  final String name;
  final String imagePath; // Path to the gift's image
  final double price;
  final String category; // 'Coffee', 'Cake', etc.

  GiftItem(
      {required this.name,
      required this.imagePath,
      required this.price,
      required this.category});
}
