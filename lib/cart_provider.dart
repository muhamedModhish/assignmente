import 'package:flutter/material.dart';
import 'models/product.dart';

class CartProvider extends ChangeNotifier {
  final List<Product> _items = [];
  final List<Product> _favorites = [];

  List<Product> get items => _items;
  List<Product> get favorites => _favorites;

  void add(Product product) {
    _items.add(product);
    notifyListeners();
  }

  void remove(Product product) {
    _items.remove(product);
    notifyListeners();
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }

  int get count => _items.length;

  double get totalPrice =>
      _items.fold(0, (sum, item) => sum + item.price);

  // ⭐ المفضلة
  void toggleFavorite(Product product) {
    if (_favorites.contains(product)) {
      _favorites.remove(product);
    } else {
      _favorites.add(product);
    }
    notifyListeners();
  }

  bool isFavorite(Product product) {
    return _favorites.contains(product);
  }
}