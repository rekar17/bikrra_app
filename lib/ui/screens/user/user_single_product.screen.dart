import 'package:bikrra_app/classes/product.class.dart';
import 'package:bikrra_app/constants/app_colors.dart';
import 'package:bikrra_app/constants/methods.dart';
import 'package:bikrra_app/providers/product_favorite.provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class UserSingleProductScreen extends StatefulWidget {
  final ProductC product;

  const UserSingleProductScreen({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<UserSingleProductScreen> createState() =>
      _UserSingleProductScreenState();
}

class _UserSingleProductScreenState extends State<UserSingleProductScreen> {
  int count = 1;
  int totalPrice = 0;

  @override
  void initState() {
    totalPrice = widget.product.price;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isFavorite = Provider.of<ProductFavoriteProvider>(context)
        .isFavorite(widget.product);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                SizedBox(
                  height: 400,
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.mainPinkColor.withOpacity(0.7),
                      image: DecorationImage(
                        image: AssetImage(widget.product.image),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.mainPinkColor.withOpacity(0.3),
                        ),
                        child: Column(
                          children: [
                            const SizedBox(height: 40),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: const CircleAvatar(
                                      backgroundColor: AppColors.mainPinkColor,
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Icon(
                                          FontAwesomeIcons.chevronRight,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  CircleAvatar(
                                    backgroundColor: Colors.white,
                                    child: IconButton(
                                      onPressed: () {
                                        if (isFavorite) {
                                          Provider.of<ProductFavoriteProvider>(
                                                  context,
                                                  listen: false)
                                              .removeProduct(widget.product);
                                        } else {
                                          Provider.of<ProductFavoriteProvider>(
                                                  context,
                                                  listen: false)
                                              .addProduct(widget.product);

                                          ScaffoldMessenger.of(
                                                  context) // Add this line
                                              .showSnackBar(
                                            const SnackBar(
                                              content: Text(
                                                  'تم اضافة المنتج الى المفضلة'),
                                            ),
                                          );
                                        }
                                      },
                                      icon: Icon(
                                        isFavorite
                                            ? FontAwesomeIcons.solidHeart
                                            : FontAwesomeIcons.heart,
                                        color: AppColors.mainPinkColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )),
                  ),
                ),
                Positioned(
                  top: 380,
                  left: MediaQuery.of(context).size.width / 2 - 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: const Color(0xFFFF99B8)),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  count--;
                                  totalPrice = count * widget.product.price;
                                  if (count < 1) {
                                    count = 1;
                                    totalPrice = widget.product.price;
                                  }
                                });
                              },
                              splashColor: AppColors.cakePinkColor,
                              hoverColor: AppColors.cakePinkColor,
                              focusColor: AppColors.cakePinkColor,
                              iconSize: 25,
                              icon: const Icon(FontAwesomeIcons.minus,
                                  color: Colors.white),
                            ),
                            CircleAvatar(
                              backgroundColor: AppColors.mainPinkColor,
                              child: Text(
                                count.toString(),
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  count++;
                                  totalPrice = count * widget.product.price;
                                });
                              },
                              splashColor: AppColors.cakePinkColor,
                              hoverColor: AppColors.cakePinkColor,
                              focusColor: AppColors.cakePinkColor,
                              iconSize: 30,
                              icon: const Icon(FontAwesomeIcons.plus,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 60,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.product.name,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 22,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${priceWithComma(widget.product.price)} دينار',
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 20,
                          color: AppColors.mainPinkColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    widget.product.description,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const SizedBox(height: 10),
                  const SizedBox(height: 10),
                  Text(
                    'السعر الكلي: ${priceWithComma(totalPrice)}دينار',
                    style: const TextStyle(
                      fontSize: 18,
                      color: AppColors.kButtonsAndSecondaryBrownColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: 50,
                    margin: const EdgeInsets.symmetric(horizontal: 40),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.mainPinkColor),
                    child: MaterialButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('تم اضافة المنتج الى السلة'),
                          ),
                        );
                      },
                      child: const Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              FontAwesomeIcons.cartShopping,
                              color: Colors.white,
                            ),
                            SizedBox(width: 10),
                            Text(
                              'اضافة الى السلة',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
