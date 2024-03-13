import 'package:bikrra_app/constants/app_colors.dart';
import 'package:bikrra_app/constants/methods.dart';
import 'package:bikrra_app/providers/product_cart.provider.dart';
import 'package:bikrra_app/ui/screens/user/user_order_checkout.screen.dart';
import 'package:bikrra_app/ui/widgets/cart.widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class UserShoppingCartScreen extends StatefulWidget {
  const UserShoppingCartScreen({super.key});

  @override
  State<UserShoppingCartScreen> createState() => _UserShoppingCartScreenState();
}

class _UserShoppingCartScreenState extends State<UserShoppingCartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'لیستی داواکاریەکان',
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
      ),
      body: ListView.builder(
        itemCount: context.watch<ProductCartProvider>().cartCount,
        itemBuilder: (context, index) => CartWidget(
          image: context.watch<ProductCartProvider>().productCart[index].image,
          name: context.watch<ProductCartProvider>().productCart[index].name,
          description: context
              .watch<ProductCartProvider>()
              .productCart[index]
              .description,
          price: context.watch<ProductCartProvider>().productCart[index].price,
          isFavorite: context
              .watch<ProductCartProvider>()
              .productCart[index]
              .isFavorite!,
        ),
      ),
      bottomSheet: context.watch<ProductCartProvider>().cartCount > 0
          ? BottomSheet(
              onClosing: () {},
              builder: (context) => Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Total Price
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(16),
                      color: Colors.grey.withOpacity(0.2),
                      child: Text(
                        'کۆی گشتی: ${context.watch<ProductCartProvider>().totalPrice} د.ع',
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 50,
                      margin: const EdgeInsets.symmetric(horizontal: 40),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.mainPinkColor),
                      child: MaterialButton(
                        onPressed: () {
                          // ScaffoldMessenger.of(context).showSnackBar(
                          //   const SnackBar(
                          //     content: Text('تم اضافة المنتج الى السلة'),
                          //   ),
                          // );

                          pushScreen(context, UserOrderCheckoutScreen());
                        },
                        child: const Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                FontAwesomeIcons.cartFlatbed,
                                color: Colors.white,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'دڵنیابوونەوە',
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
              ),
            )
          : null,
    );
  }
}
