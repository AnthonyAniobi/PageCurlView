import 'package:flutter/material.dart';
import 'package:ntisa_burgers/model/product_model.dart';
import 'package:provider/provider.dart';

class CartProvider extends ChangeNotifier {
  List<ProductModel> cartItems = [];

  static CartProvider of(BuildContext context, {bool listen = false}) =>
      Provider.of(context, listen: listen);

  void addToCart(ProductModel product) {
    if (cartItems.contains(product)) {
      int productIndex = cartItems.indexOf(product);
      cartItems[productIndex].quantity += product.quantity;
    } else {
      cartItems.add(product);
    }
    notifyListeners();
  }

  bool removeFromCart(ProductModel product) {
    bool result = false;
    if (cartItems.contains(product)) {
      cartItems.remove(product);
      result = true;
    }
    notifyListeners();
    return result;
  }

  int numInCart() {
    return cartItems.length;
  }

  bool inCart(ProductModel product) {
    return cartItems.contains(product);
  }
}
