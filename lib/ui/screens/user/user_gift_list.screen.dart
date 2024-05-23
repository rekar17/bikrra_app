import 'package:bikrra_app/classes/gift.class.dart';
import 'package:bikrra_app/constants/app_colors.dart';
import 'package:bikrra_app/ui/widgets/gift.widget.dart';
import 'package:flutter/material.dart';

class UserGiftListScreen extends StatelessWidget {
  // Sample gift data - replace with actual data fetching logic
  final List<GiftItem> giftList = [
    GiftItem(
        name: 'Cappuccino & Brownie',
        imageAssetPath: 'assets/bikrra_logo.jpeg',
        price: 8.99,
        category: 'Coffee'),
    GiftItem(
        name: 'Red Velvet Cake Slice',
        imageAssetPath: 'assets/bikrra_logo.jpeg',
        price: 5.50,
        category: 'Cake'),
    // ...more gift items
  ];

  UserGiftListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cakeLightBrwonColor,
      appBar: AppBar(
        title: Text('لیستی دیاریەکان',
            style: TextStyle(color: AppColors.textColor)),
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: giftList.length,
        itemBuilder: (context, index) {
          final gift = giftList[index];
          return GiftWidget(gift: gift); // Create custom widget for each item
        },
      ),
    );
  }
}
