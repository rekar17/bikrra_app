import 'package:bikrra_app/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CakeTextField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  CakeTextField({required this.controller, required this.hintText});

  @override
  State<CakeTextField> createState() => _CakeTextFieldState();
}

class _CakeTextFieldState extends State<CakeTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      style: TextStyle(
          color: AppColors.kButtonsAndSecondaryBrownColor, fontSize: 18),
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextStyle(
            color: AppColors.kButtonsAndSecondaryBrownColor, fontSize: 18),
        fillColor: Colors.brown.shade100,
        filled: true,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide:
                BorderSide(color: AppColors.kButtonsAndSecondaryBrownColor)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide:
                BorderSide(color: AppColors.kButtonsAndSecondaryBrownColor)),
      ),
    );
  }
}
