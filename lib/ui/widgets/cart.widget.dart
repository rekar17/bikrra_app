import 'package:bikrra_app/classes/product.class.dart';
import 'package:bikrra_app/constants/app_colors.dart';
import 'package:bikrra_app/constants/methods.dart';
import 'package:bikrra_app/providers/product_cart.provider.dart';
import 'package:bikrra_app/ui/screens/user/user_single_product.screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartWidget extends StatefulWidget {
  final ProductC product;

  const CartWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    quantity = Provider.of<ProductCartProvider>(context)
        .productQuantity(widget.product);
    return GestureDetector(
      onTap: () {
        pushScreen(context, UserSingleProductScreen(product: widget.product));
      },
      child: Card(
        margin: const EdgeInsets.all(8),
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: ListTile(
            leading: SizedBox(
              width: 70,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: widget.product.image.contains('assets')
                    ? Image.asset(
                        widget.product.image,
                        fit: BoxFit.fill,
                      )
                    : CachedNetworkImage(
                        imageUrl: widget.product.image,
                        imageBuilder: (context, imageProvioder) {
                          return Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: imageProvioder, fit: BoxFit.fill),
                            ),
                          );
                        },
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) =>
                                CircularProgressIndicator(
                                    value: downloadProgress.progress),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
              ),
            ),
            title: Text(
              widget.product.name,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Row(
                children: [
                  SizedBox(
                    width: 30,
                    height: 30,
                    child: MaterialButton(
                      padding: const EdgeInsets.all(2),
                      color: Colors.red,
                      child: const Icon(Icons.remove),
                      onPressed: () {
                        setState(() {
                          quantity = quantity > 0 ? quantity - 1 : 1;
                        });
                        if (quantity > 0) {
                          Provider.of<ProductCartProvider>(context,
                                  listen: false)
                              .decreaseProduct(widget.product);
                        }
                      },
                    ),
                  ),
                  const SizedBox(width: 8), // Add some spacing
                  Text(
                    '$quantity',
                    style: const TextStyle(fontSize: 14),
                  ),
                  const SizedBox(width: 8), // Add some spacing
                  SizedBox(
                    width: 30,
                    height: 30,
                    child: MaterialButton(
                      padding: const EdgeInsets.all(2),
                      color: Colors.green,
                      child: const Center(
                          child: Icon(Icons.add, color: Colors.black)),
                      onPressed: () {
                        setState(() {
                          quantity += 1;
                        });
                        Provider.of<ProductCartProvider>(context, listen: false)
                            .addProduct(widget.product);
                      },
                    ),
                  ),
                  const SizedBox(width: 8), // Add some spacing
                  Text(
                    '${priceWithComma(widget.product.price * quantity)} د.ع',
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.kButtonsAndSecondaryBrownColor,
                    ),
                  ),
                ],
              ),
            ),
            trailing: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Material(
                    color: Colors.grey.shade600,
                    child: Padding(
                      padding: const EdgeInsets.all(2),
                      child: GestureDetector(
                        onTap: () {
                          Provider.of<ProductCartProvider>(context,
                                  listen: false)
                              .removeProduct(widget.product);
                        },
                        child: const Icon(
                          Icons.cancel,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
