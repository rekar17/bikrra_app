import 'package:flutter/material.dart';

Future pushScreen(BuildContext context, Widget screen) {
  return Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => screen),
  );
}

String priceWithComma(dynamic price) {
  if (price == null) return '0';
  if (price is String) {
    return price.replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},');
  }
  ;
  if (price is int) {
    return price.toString().replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},');
  } else {
    return price.toStringAsFixed(2).replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},');
  }
}
