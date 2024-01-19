import 'package:bikrra_app/constants/app_colors.dart';
import 'package:bikrra_app/ui/widgets/order.widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserOrderList extends StatefulWidget {
  const UserOrderList({super.key});

  @override
  State<UserOrderList> createState() => _UserOrderListState();
}

class _UserOrderListState extends State<UserOrderList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'قائمة الطلبات',
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
          itemCount: 10, itemBuilder: (context, index) => OrderWidget()),
    );
  }
}
