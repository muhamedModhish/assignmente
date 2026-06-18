import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_provider.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("المفضلة ❤️ (${cart.favorites.length})"),
      ),
      body: cart.favorites.isEmpty
          ? Center(child: Text("لا توجد عناصر في المفضلة"))
          : ListView.builder(
              itemCount: cart.favorites.length,
              itemBuilder: (context, index) {
                final item = cart.favorites[index];
                return ListTile(
                  // استخدام Image.network بدلاً من Image.asset
                  leading: Image.network(
                    item.image,
                    width: 50,
                    height: 50,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return Icon(Icons.image_not_supported, size: 50);
                    },
                  ),
                  title: Text(
                    item.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text("${item.price.toStringAsFixed(2)} \$"),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      cart.toggleFavorite(item); // حذف من المفضلة
                    },
                  ),
                );
              },
            ),
    );
  }
}