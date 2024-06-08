import 'package:bikrra_app/classes/product.class.dart';
import 'package:bikrra_app/constants/shared_values.dart';
import 'package:flutter/foundation.dart';
import 'dart:convert';

class ProductFavoriteProvider with ChangeNotifier {
  List<ProductC> _products = [];

  List<ProductC> get products => _products;

  ProductFavoriteProvider() {
    _loadProducts();
  }

  void _loadProducts() {
    try {
      final products =
          SharedValues.sharedPreferences!.getStringList('favorites');
      if (products != null) {
        _products =
            products.map((e) => ProductC.fromJson(jsonDecode(e))).toList();
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error loading products: $e');
      }
    }
  }

  void addProduct(ProductC product) {
    final index = _products.indexWhere((p) => p.id == product.id);
    if (index == -1) {
      _products.add(product);
      _saveProducts();
    }
    notifyListeners();
  }

  void removeProduct(ProductC product) {
    _products.removeWhere((p) => p.id == product.id);
    _saveProducts();
    notifyListeners();
  }

  void _saveProducts() {
    final products = _products.map((e) => e.toJson()).toList();
    SharedValues.sharedPreferences!.setStringList('favorites', products);
    notifyListeners();
  }

  bool isFavorite(ProductC product) {
    return _products.any((p) => p.id == product.id);
  }
}
