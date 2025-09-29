import 'package:bikrra_app/classes/gift.class.dart';
import 'package:bikrra_app/constants/app_colors.dart';
import 'package:bikrra_app/ui/widgets/gift.widget.dart';
import 'package:flutter/material.dart';

class UserGiftListScreen extends StatelessWidget {
  //  final List<GiftItem> giftList = [
  //   GiftItem(
  //       name: 'كرسي مودرن',
  //       imagePath: 'assets/bikrra_logo.jpeg',
  //       price: 8.99,
  //       category: 'Mobilya'),
  //   GiftItem(
  //       name: 'Air conditioner',
  //       imagePath: 'assets/bikrra_logo.jpeg',
  //       price: 5.50,
  //       category: 'Elektronik'),
  // ];

  final List<GiftItem> giftList;

  UserGiftListScreen({super.key, required this.giftList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cakeLightBrwonColor,
      appBar: AppBar(
        title: const Text('لیستی دیاریەکان',
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
