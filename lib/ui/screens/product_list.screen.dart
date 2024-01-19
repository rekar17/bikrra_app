// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, avoid_function_literals_in_foreach_calls

import 'package:bikrra_app/ui/widgets/product.widget.dart';

import 'package:flutter/material.dart';

class ProductListScreen extends StatefulWidget {
  ProductListScreen({Key? key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
      child: ListView(
        clipBehavior: Clip.none,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: const [
          ProductWidget(
              image: 'assets/wedding_cake_image.jpg',
              name: 'كيكة زفاف دائرية',
              description: 'كيكة زفاف دائرية وجميلة للغاية',
              price: 23000,
              isFavorate: true),
          ProductWidget(
              image: 'assets/birthday_cake_image.jpg',
              name: 'كيكة عيد ميلاد',
              description: 'كيكة عيد ميلاد مميزة وجميلة للغاية',
              price: 20000,
              isFavorate: true),
        ],
      ),
    );
  }
}
