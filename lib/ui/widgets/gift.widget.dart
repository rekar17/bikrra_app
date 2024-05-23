import 'package:bikrra_app/classes/gift.class.dart';
import 'package:bikrra_app/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/widgets.dart';

class GiftWidget extends StatelessWidget {
  final GiftItem gift;

  const GiftWidget({required this.gift});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white, // Example background
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Image.asset(gift.imageAssetPath, width: 80, height: 80),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(gift.name,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textColor)),
                Text('Category: ${gift.category}',
                    style: const TextStyle(color: AppColors.textColor)),
                Text('\$${gift.price.toStringAsFixed(2)}',
                    style: const TextStyle(
                        color: AppColors.textColor)), // Format price
              ],
            ),
          ),
          MaterialButton(
            height: 50,
            onPressed: () async {
              // await showDialog(
              //     context: context,
              //     builder: (context) {
              //       return Container(
              //         color: Colors.white,
              //         child: Text('دیاریکرا!'),
              //       );
              //     });
            },
            shape: RoundedRectangleBorder(
              side: const BorderSide(
                color: AppColors.cakePinkColor,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(
                10,
              ),
            ),
            child: AnimatedTextKit(
              isRepeatingAnimation: true,
              repeatForever: true,
              animatedTexts: [
                ScaleAnimatedText(
                  'دیاری کردن',
                  duration: const Duration(seconds: 1),
                  scalingFactor: 1,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
