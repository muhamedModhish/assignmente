import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:electronic_stor/models/product.dart';

class ProductService {
  // رابط API لجلب المنتجات - استخدام dummyjson.com
  static const String _baseUrl = 'https://dummyjson.com';

  // جلب جميع المنتجات باستخدام HTTP GET
  static Future<List<Product>> fetchProducts() async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl/products'));

      if (response.statusCode == 200) {
        // تحويل البيانات من JSON إلى قائمة منتجات
        Map<String, dynamic> data = json.decode(response.body);
        List<dynamic> jsonData = data['products'];
        return jsonData.map((item) => Product.fromJson(item)).toList();
      } else {
        throw Exception('فشل في تحميل المنتجات: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('خطأ في الاتصال: $e');
    }
  }
}
