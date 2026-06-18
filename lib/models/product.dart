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
}
