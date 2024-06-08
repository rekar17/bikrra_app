import 'package:bikrra_app/constants/app_colors.dart';
import 'package:bikrra_app/providers/product_favorite.provider.dart';
import 'package:bikrra_app/ui/widgets/favorite_widget.widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class UserProductFavoriteScreen extends StatefulWidget {
  const UserProductFavoriteScreen({super.key});

  @override
  State<UserProductFavoriteScreen> createState() =>
      _UserProductFavoriteScreenState();
}

class _UserProductFavoriteScreenState extends State<UserProductFavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    var products = context.watch<ProductFavoriteProvider>().products;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'دڵخوازەکان',
          style: TextStyle(
            fontSize: 24,
            color: AppColors.kButtonsAndSecondaryBrownColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const CircleAvatar(
            backgroundColor: AppColors.meduimPinkColor,
            child: Align(
              alignment: Alignment.center,
              child: Icon(
                FontAwesomeIcons.chevronRight,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: products.isEmpty
          ? const Center(
              child: Text(
                'هیچ دڵخوازەیەکت نییە 🫠',
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.kButtonsAndSecondaryBrownColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          : GridView.builder(
              itemCount: products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
              ),
              itemBuilder: (context, index) => FavoriteWidget(
                product: products[index],
              ),
            ),
    );
  }
}
