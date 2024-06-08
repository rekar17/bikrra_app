import 'package:bikrra_app/classes/product.class.dart';
import 'package:bikrra_app/constants/app_colors.dart';
import 'package:bikrra_app/constants/methods.dart';
import 'package:bikrra_app/ui/screens/user/user_mobilya/user_mobilya_detail.screen.dart';
import 'package:flutter/material.dart';

class ProductWidget extends StatefulWidget {
  final ProductC product;
  const ProductWidget({
    super.key,
    required this.product,
  });

  @override
  State<ProductWidget> createState() => _CoffeeItemState();
}

class _CoffeeItemState extends State<ProductWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        pushScreen(
            context,
            UserMobilyaDetailScreen(
              product: widget.product,
            ));
      },
      child: Container(
        height: 230,
        width: 190,
        margin: const EdgeInsets.only(right: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: AppColors.mainPinkColor.withOpacity(0.5),
              blurRadius: 10,
              offset: const Offset(0, 3),
            )
          ],
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                SizedBox(
                  height: 100,
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: AspectRatio(
                      aspectRatio: 5,
                      child: Image.asset(
                        widget.product.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.product.name,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    // Text(
                    //   '${priceWithComma(widget.price)} د.ع',
                    //   overflow: TextOverflow.ellipsis,
                    //   style: const TextStyle(
                    //       fontSize: 18,
                    //       fontWeight: FontWeight.bold,
                    //       color: AppColors.mainPinkColor),
                    // )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  widget.product.description,
                  overflow: TextOverflow.ellipsis,
                ),
              ]),
              //favorate icon
              const Positioned(
                right: 65,
                top: 80,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.favorite),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
