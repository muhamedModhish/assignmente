import 'package:electronic_stor/cart_provider.dart';
import 'package:electronic_stor/cart_screen.dart';
import 'package:electronic_stor/constansts.dart';
import 'package:electronic_stor/favorites_screen.dart' show FavoritesScreen;
import 'package:electronic_stor/widgets/home/home_body.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:electronic_stor/screens/favorites_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: homeAppar(context),
      body: HomeBody(),
    );
  }

  AppBar homeAppar(BuildContext context) {
    return AppBar(
      title: Text("مرحبا بكم بمتجر الكترونيات"),
      centerTitle: false,
      actions: [
        IconButton(
          icon: Icon(Icons.favorite),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => FavoritesScreen()),
            );
          },
        ),
        Consumer<CartProvider>(
          builder: (context, cart, child) {
            return Stack(
              children: [
                IconButton(
                  icon: Icon(Icons.shopping_cart),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => CartScreen()),
                    );
                  },
                ),

                if (cart.count > 0)
                  Positioned(
                    right: 6,
                    top: 6,
                    child: Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        "${cart.count}",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ],
    );
  }
}
