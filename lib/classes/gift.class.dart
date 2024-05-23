class GiftItem {
  final String name;
  final String imageAssetPath; // Path to the gift's image
  final double price;
  final String category; // 'Coffee', 'Cake', etc.

  GiftItem(
      {required this.name,
      required this.imageAssetPath,
      required this.price,
      required this.category});
}
