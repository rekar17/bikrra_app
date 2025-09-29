// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class CategoryWidget extends StatefulWidget {
  final String type;
  final String image;
  final Function onTap;
  CategoryWidget(
      {required this.type, required this.image, required this.onTap});

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onTap(),
      child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey.shade100,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Image.asset(
                    widget.image,
                    height: 40,
                    width: 40,
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
                    fontFamily: 'Peshang',
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          decoration: BoxDecoration(
            boxShadow: [],
          )),
    );
  }
}
