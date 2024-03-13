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
              image: 'assets/mobilya_images/mobilya_seat.jpg',
              name: 'كرسي مودرن',
              description: 'كرسي مودرن مميز وجميل للغاية',
              type: 'اثاث',
              price: 120000,
              isFavorate: true),
          ProductWidget(
              image: 'assets/mobilya_images/wedding_bed.jpg',
              name: 'سرير زواج',
              description: 'سرير زواج مميز وجميل للغاية',
              type: 'اثاث',
              price: 320000,
              isFavorate: true),
          ProductWidget(
              image: 'assets/mobilya_images/house_freezer.jpeg',
              name: 'ثلاجة منزلية',
              description: 'ثلاجة منزلية مميزة وجميلة للغاية',
              type: 'اثاث',
              price: 120000,
              isFavorate: true),
        ],
      ),
    );
  }
}
