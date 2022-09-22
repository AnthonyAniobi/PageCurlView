import 'package:flutter/material.dart';
import 'package:ntisa_burgers/model/product_model.dart';
import 'package:provider/provider.dart';

class CartProvider extends ChangeNotifier {
  List<ProductModel> cartItems = [];

  static CartProvider of(BuildContext context, {bool listen = false}) =>
      Provider.of(context, listen: listen);

  void addToCart(ProductModel product) {
    cartItems.add(product);
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
}
