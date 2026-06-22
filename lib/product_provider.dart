import 'package:flutter/material.dart';
import 'package:electronic_stor/models/product.dart';
import 'package:electronic_stor/services/product_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> _products = [];
  bool _isLoading = false;
  String _errorMessage = '';

  // Getters
  List<Product> get products => _products;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  // جلب المنتجات وهجرتها تلقائياً إلى Firestore إن كانت فارغة
  Future<void> loadProducts() async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      final productsRef = FirebaseFirestore.instance.collection('products');
      // التحقق مما إذا كانت قاعدة البيانات تحتوي على منتجات
      final snapshot = await productsRef.limit(1).get();

      if (snapshot.docs.isEmpty) {
        // جلب المنتجات من API الخارجي
        List<Product> apiProducts = await ProductService.fetchProducts();
        
        // رفع المنتجات إلى Firestore
        for (var product in apiProducts) {
          await productsRef.doc(product.id.toString()).set(product.toMap());
        }
      }

      // جلب القائمة من Firestore للاحتياط
      final allSnapshot = await productsRef.get();
      _products = allSnapshot.docs.map((doc) => Product.fromDoc(doc)).toList();
    } catch (e) {
      _errorMessage = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }
}
