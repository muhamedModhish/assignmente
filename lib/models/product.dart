import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  final int id;
  final double price;
  final String title, description, image;
  final String category;
  final double rating;

  Product({
    required this.id,
    required this.price,
    required this.title,
    required this.description,
    required this.image,
    this.category = '',
    this.rating = 0.0,
  });

  // تحويل بيانات JSON إلى كائن Product
  factory Product.fromJson(Map<String, dynamic> json) {
    // معالجة التقييم بشكل مرن لتفادي استثناءات اختلاف الهيكل بين APIs
    double parsedRating = 0.0;
    if (json['rating'] != null) {
      if (json['rating'] is num) {
        parsedRating = (json['rating'] as num).toDouble();
      } else if (json['rating'] is Map && json['rating']['rate'] != null) {
        parsedRating = (json['rating']['rate'] as num).toDouble();
      }
    }

    return Product(
      id: json['id'] ?? 0,
      price: (json['price'] ?? 0).toDouble(),
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      image: json['image'] ?? json['thumbnail'] ?? '',
      category: json['category'] ?? '',
      rating: parsedRating,
    );
  }

  // تحويل وثيقة Firestore إلى كائن Product
  factory Product.fromDoc(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>? ?? {};
    
    // معالجة الـ id بشكل آمن ليتناسب مع السلاسل النصية أو الأرقام
    dynamic rawId = data['id'];
    int parsedId = 0;
    if (rawId is int) {
      parsedId = rawId;
    } else if (rawId is String) {
      parsedId = int.tryParse(rawId) ?? 0;
    } else {
      parsedId = int.tryParse(doc.id) ?? 0;
    }

    double parsedRating = 0.0;
    if (data['rating'] != null) {
      if (data['rating'] is num) {
        parsedRating = (data['rating'] as num).toDouble();
      }
    }

    return Product(
      id: parsedId,
      price: (data['price'] ?? 0).toDouble(),
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      image: data['image'] ?? data['thumbnail'] ?? '',
      category: data['category'] ?? '',
      rating: parsedRating,
    );
  }

  // تحويل كائن Product إلى خريطة Map لحفظه في Firestore
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'price': price,
      'title': title,
      'description': description,
      'image': image,
      'category': category,
      'rating': rating,
    };
  }
}
