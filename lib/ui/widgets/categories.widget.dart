// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:bikrra_app/constants/app_colors.dart';

import 'package:flutter/material.dart';

class CategoryWidget extends StatefulWidget {
  final String type;
  final String image;
  CategoryWidget({required this.type, required this.image});

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.grey.shade300,
              ),
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Image.asset(
                  widget.image,
                  height: 30,
                  width: 30,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              '${widget.type} ',
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
        decoration: BoxDecoration(
          boxShadow: [],
        ));
  }
}
