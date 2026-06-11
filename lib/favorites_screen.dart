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
                  leading: Image.asset(item.image),
                  title: Text(item.title),
                  subtitle: Text("${item.price} \$"),
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