import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_provider.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("السلة (${cart.count})"),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: cart.clear,
          )
        ],
      ),
      body: cart.items.isEmpty
          ? Center(child: Text("السلة فارغة 🛒"))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cart.items.length,
                    itemBuilder: (context, index) {
                      final item = cart.items[index];
                      return ListTile(
                        leading: Image.asset(item.image),
                        title: Text(item.title),
                        subtitle: Text("${item.price} \$"),
                        trailing: IconButton(
                          icon: Icon(Icons.remove_circle),
                          onPressed: () => cart.remove(item),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    "الإجمالي: ${cart.totalPrice} \$",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
    );
  }
}