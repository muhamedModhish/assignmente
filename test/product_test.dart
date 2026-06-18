import 'package:flutter_test/flutter_test.dart';
import 'package:electronic_stor/models/product.dart';

void main() {
  group('Product.fromJson Tests', () {
    test('Should parse FakeStoreAPI json structure successfully', () {
      final fakeStoreJson = {
        "id": 1,
        "title": "Fjallraven - Foldsack",
        "price": 109.95,
        "description": "Your perfect pack for everyday use",
        "category": "men's clothing",
        "image": "https://fakestoreapi.com/img/81f.jpg",
        "rating": {
          "rate": 3.9,
          "count": 120
        }
      };

      final product = Product.fromJson(fakeStoreJson);

      expect(product.id, 1);
      expect(product.title, "Fjallraven - Foldsack");
      expect(product.price, 109.95);
      expect(product.description, "Your perfect pack for everyday use");
      expect(product.category, "men's clothing");
      expect(product.image, "https://fakestoreapi.com/img/81f.jpg");
      expect(product.rating, 3.9);
    });

    test('Should parse DummyJSON API json structure successfully', () {
      final dummyJson = {
        "id": 2,
        "title": "Essence Mascara Lash Princess",
        "description": "Popular mascara",
        "category": "beauty",
        "price": 9.99,
        "rating": 4.94,
        "thumbnail": "https://cdn.dummyjson.com/thumbnail.png"
      };

      final product = Product.fromJson(dummyJson);

      expect(product.id, 2);
      expect(product.title, "Essence Mascara Lash Princess");
      expect(product.price, 9.99);
      expect(product.description, "Popular mascara");
      expect(product.category, "beauty");
      expect(product.image, "https://cdn.dummyjson.com/thumbnail.png"); // should fall back to thumbnail
      expect(product.rating, 4.94);
    });

    test('Should handle null/missing rating and image gracefully', () {
      final incompleteJson = {
        "id": 3,
        "title": "Incomplete Product",
        "price": 15
      };

      final product = Product.fromJson(incompleteJson);

      expect(product.id, 3);
      expect(product.title, "Incomplete Product");
      expect(product.price, 15.0);
      expect(product.description, "");
      expect(product.image, "");
      expect(product.rating, 0.0);
    });
  });
}
