// ignore_for_file: dead_code

import 'dart:convert';
import 'dart:io';

import 'package:bikrra_app/classes/gift.class.dart';
import 'package:bikrra_app/classes/product.class.dart';
import 'package:bikrra_app/constants/app_colors.dart';
import 'package:bikrra_app/providers/product_cart.provider.dart';
import 'package:bikrra_app/ui/screens/user/wedding_card_information.screen.dart';
import 'package:bikrra_app/ui/widgets/comfirm_dialog.widget.dart';
import 'package:bikrra_app/validators/validators.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class UserOrderCheckoutScreen extends StatefulWidget {
  final List<ProductC> products;
  const UserOrderCheckoutScreen({super.key, required this.products});

  @override
  State<UserOrderCheckoutScreen> createState() =>
      _UserOrderCheckoutScreenState();
}

class _UserOrderCheckoutScreenState extends State<UserOrderCheckoutScreen> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final notesController = TextEditingController();

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  String? deviceId;
  Future<void> initPlatformState() async {
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      if (Platform.isIOS) {
        var ios = await DeviceInfoPlugin().iosInfo;
        deviceId = ios.identifierForVendor;
      }
      if (Platform.isAndroid) {
        var android = await DeviceInfoPlugin().androidInfo;
        deviceId = android.serialNumber;
      }
    } on PlatformException {
      deviceId = 'Failed to get deviceId.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'دڵنیابوونەوە لە داواکاری',
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
      body: Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'ناو',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
              ),
              validator: (value) {
                return Validators.text(value);
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: phoneController,
              decoration: const InputDecoration(
                labelText: 'ژمارەی مۆبایل',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
              ),
              validator: (value) {
                return Validators.phone(value);
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: addressController,
              decoration: const InputDecoration(
                labelText: 'ناونیشان',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
              ),
              validator: (value) {
                return Validators.text(value);
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: notesController,
              maxLength: 200,
              maxLines: 5,
              decoration: const InputDecoration(
                labelText: 'تێبینیەکان',
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.all(Radius.circular(16))),
              ),
              validator: (value) {
                return Validators.note(value, isRequired: false);
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: isLoading
                  ? () {}
                  : () async {
                      if (!formKey.currentState!.validate()) return;

                      var sure = await comfirmDialogWidget(context);

                      if (!sure! || !context.mounted) return;

                      var products = Provider.of<ProductCartProvider>(context,
                              listen: false)
                          .products;

                      products
                          .map((product) => GiftItem(
                                  name: product.name,
                                  imagePath: product.image,
                                  price: double.parse(product.price.toString()),
                                  category: product.category
                                      .name) // Assuming your ProductC has name, image, price, and category properties
                              )
                          .toList();

                      final giftListJson = jsonEncode(products);

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WeddingCardInformationScreen(
                            giftList: giftListJson,
                          ),
                        ),
                      );

                      setState(() {
                        isLoading = true;
                      });
                      var sent = true;
                      // var sent = await OrderAPI.addOrder(OrderC(
                      //   customerName: nameController.text,
                      //   customerPhone: phoneController.text,
                      //   customerAddress: addressController.text,
                      //   note: notesController.text,
                      //   customerDeviceId: deviceId!,
                      //   products: widget.products,
                      //   total: Provider.of<ProductCartProvider>(context,
                      //           listen: false)
                      //       .totalAll,
                      //   quantity: Provider.of<ProductCartProvider>(context,
                      //           listen: false)
                      //       .productCount,
                      // ));

                      setState(() {
                        isLoading = false;
                      });
                      if (!context.mounted) return;
                      if (sent) {
                        await showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('داواکاری بە سەرکەوتویی داواکرا'),
                            content: const Text(
                                'داواکاری بە سەرکەوتویی داواکرا، سپاس بۆ داواکاریکردنی بەرهەمەکان'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Provider.of<ProductCartProvider>(context,
                                          listen: false)
                                      .clearProducts();
                                  // FirebaseMessaging.instance
                                  //     .subscribeToTopic('orders');

                                  if (!context.mounted) return;
                                  Navigator.of(context).pop(true);
                                },
                                child: const Text('باشە'),
                              ),
                            ],
                          ),
                        );
                        if (!context.mounted) return;
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('داواکاری بە سەرکەوتویی داواکرا'),
                          ),
                        );
                      } else {
                        // ScaffoldMessenger.of(context).showSnackBar(
                        //   const SnackBar(
                        //     content:
                        //         Text('هەڵەیەک ڕوویدا، تکایە دوبارە هەوڵ بدەوە'),
                        //   ),
                        // );
                      }
                    },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.mainPinkColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: isLoading
                  ? const CircularProgressIndicator()
                  : const Text(
                      'داواکاری بکە',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
