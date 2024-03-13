import 'package:bikrra_app/classes/product.class.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bikrra_app/constants/shared_values.dart';

class ProductCartProvider with ChangeNotifier {
  List<ProductC> _productCart = [];

  List<ProductC> get productCart => _productCart;

  void addProductToCart(ProductC product) {
    if (_productCart.contains(product)) {
      _productCart[_productCart.indexOf(product)].quantity =
          _productCart[_productCart.indexOf(product)].quantity! + 1;
    } else {
      _productCart.add(product);
    }
    SharedValues.sharedPreferences!.setStringList(
        'productCart', _productCart.map((e) => e.toJson()).toList());
    notifyListeners();
  }

  void removeProductFromCart(ProductC product) {
    if (_productCart.contains(product)) {
      if (_productCart[_productCart.indexOf(product)].quantity! > 1) {
        _productCart[_productCart.indexOf(product)].quantity =
            _productCart[_productCart.indexOf(product)].quantity! - 1;
      } else {
        _productCart.remove(product);
      }
    }
    SharedValues.sharedPreferences!.setStringList(
        'productCart', _productCart.map((e) => e.toJson()).toList());
    notifyListeners();
  }

  void clearCart() {
    _productCart.clear();
    SharedValues.sharedPreferences!.setStringList(
        'productCart', _productCart.map((e) => e.toJson()).toList());
    notifyListeners();
  }

  void loadCart() {
    List<String>? productCart =
        SharedValues.sharedPreferences!.getStringList('productCart');
    if (productCart != null) {
      _productCart = productCart.map((e) => ProductC.fromJson(e)).toList();
    }
    notifyListeners();
  }

  int get cartCount => _productCart.length;

  int get totalPrice => _productCart.fold(
      0, (previousValue, element) => previousValue + element.price);

  bool isProductInCart(ProductC product) {
    return _productCart.contains(product);
  }
}
