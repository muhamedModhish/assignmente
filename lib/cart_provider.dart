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
    _items.removeWhere((item) => item.id == product.id);
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
    // المقارنة بالـ id بدلاً من المرجع
    if (isFavorite(product)) {
      _favorites.removeWhere((item) => item.id == product.id);
    } else {
      _favorites.add(product);
    }
    notifyListeners();
  }

  bool isFavorite(Product product) {
    return _favorites.any((item) => item.id == product.id);
  }
}