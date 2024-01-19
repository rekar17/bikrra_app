import 'package:bikrra_app/constants/app_colors.dart';
import 'package:bikrra_app/constants/methods.dart';
import 'package:flutter/material.dart';

class CartWidget extends StatefulWidget {
  final String image;
  final String name;
  final String description;
  final int price;
  final bool isFavorite;

  const CartWidget({
    Key? key,
    required this.image,
    required this.name,
    required this.description,
    required this.price,
    required this.isFavorite,
  }) : super(key: key);

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        margin: const EdgeInsets.all(8),
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: ListTile(
            leading: SizedBox(
              width: 80,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  widget.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            title: Text(
              widget.name,
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
                      padding: EdgeInsets.all(2),
                      color: Colors.red,
                      child: const Icon(Icons.remove),
                      onPressed: () {
                        setState(() {
                          quantity = quantity > 1 ? quantity - 1 : 1;
                        });
                      },
                    ),
                  ),
                  SizedBox(width: 8), // Add some spacing
                  Text(
                    '$quantity',
                    style: const TextStyle(fontSize: 14),
                  ),
                  SizedBox(width: 8), // Add some spacing
                  SizedBox(
                    width: 30,
                    height: 30,
                    child: MaterialButton(
                      padding: EdgeInsets.all(2),
                      color: Colors.green,
                      child: Center(
                          child: const Icon(Icons.add, color: Colors.black)),
                      onPressed: () {
                        setState(() {
                          quantity += 1;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 8), // Add some spacing
                  Text(
                    '${priceWithComma(widget.price * quantity)} د.ع',
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.darkGreenColor,
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
                    child: const Padding(
                      padding: EdgeInsets.all(2),
                      child: Icon(
                        Icons.cancel,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // Handle item removal
          ),
        ),
      ),
    );
  }
}
