import 'package:flutter/material.dart';
import 'package:ntisa_burgers/model/product_model.dart';
import 'package:provider/provider.dart';

class FavoritesProvider extends ChangeNotifier {
  List<ProductModel> favoriteItems = [];

  static FavoritesProvider of(BuildContext context, {bool listen = false}) =>
      Provider.of(context, listen: listen);

  void toggleFavorites(ProductModel product) {
    if (favoriteItems.contains(product)) {
      favoriteItems.remove(product);
    } else {
      favoriteItems.add(product);
    }
    notifyListeners();
  }

  int numInFavorites() {
    return favoriteItems.length;
  }

  bool isInFavorites(ProductModel product) {
    return favoriteItems.contains(product);
  }
}
