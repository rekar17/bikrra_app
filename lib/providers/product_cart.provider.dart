import 'package:bikrra_app/classes/product.class.dart';
import 'package:bikrra_app/constants/shared_values.dart';
import 'package:flutter/foundation.dart';

class ProductCartProvider with ChangeNotifier {
  List<ProductC> _products = [];

  List<ProductC> get products => _products;

  ProductCartProvider() {
    _loadProducts();
  }

  void _loadProducts() {
    try {
      final products =
          SharedValues.sharedPreferences!.getStringList('products');
      if (products != null) {
        _products = products.map((e) => ProductC.fromJson(e)).toList();
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error loading products: $e');
      }
    }
  }

  void addProduct(ProductC product) {
    final index = _products.indexWhere((p) => p.id == product.id);
    if (index != -1) {
      // Increment quantity by 1 instead of product.quantity
      _products[index].quantity++;
    } else {
      // Set quantity to 1 when adding a new product
      product.quantity = 1;
      _products.add(product);
    }
    _saveProducts();
    notifyListeners();
  }

  void decreaseProduct(ProductC product) {
    if (_products.contains(product)) {
      product.quantity--;
      if (product.quantity <= 0) {
        _products.remove(product);
      }
      _saveProducts();
    }
    notifyListeners();
  }

  void removeProduct(ProductC product) {
    _products.remove(product);
    _saveProducts();
    notifyListeners();
  }

  void clearProducts() {
    _products.clear();
    SharedValues.sharedPreferences!.remove('products');
    notifyListeners();
  }

  void _saveProducts() async {
    try {
      await SharedValues.sharedPreferences!
          .setStringList('products', _products.map((e) => e.toJson()).toList());
    } catch (e) {
      if (kDebugMode) {
        print('Error saving products: $e');
      }
    }
    notifyListeners();
  }

  double get total {
    double total = 0;
    for (var product in _products) {
      total += product.price;
    }
    return total;
  }

  //total all price
  double get totalAll {
    double total = 0;
    for (var product in _products) {
      total += product.price * product.quantity;
    }
    return total;
  }

  bool get isEmpty => _products.isEmpty;

  bool contains(ProductC product) {
    return _products.contains(product);
  }

  int productQuantity(ProductC product) {
    return products
        .where((p) => p.id == product.id)
        .fold(0, (prev, p) => prev + p.quantity);
  }

  int get productCount => _products.length;
}
