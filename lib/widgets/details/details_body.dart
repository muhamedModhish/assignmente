import 'package:electronic_stor/cart_provider.dart';
import 'package:electronic_stor/constansts.dart';
import 'package:electronic_stor/models/product.dart';
import 'package:electronic_stor/widgets/details/color_dot.dart';
import 'package:electronic_stor/widgets/details/product_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class DetailsBody extends StatelessWidget {
  final Product product;

  const DetailsBody({super.key, required this.product});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: kDefaultPadding * 1.5),
            // height: 300,
            decoration: BoxDecoration(
              color: kBackgroundColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: ProductImage(size: size, image: product.image),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: kDefaultPadding,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ColorDot(fillColor: kTextLightColor, isSelected: true),
                      ColorDot(fillColor: Colors.blue, isSelected: false),
                      ColorDot(fillColor: Colors.red, isSelected: false),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: kDefaultPadding / 2,
                  ),
                  child: Text(
                    product.title,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ),
                Text(
                  "السعر : \$${product.price},",
                  style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.w600,
                    color: kSecondaryColor,
                  ),
                ),
                SizedBox(height: kDefaultPadding),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
            padding: EdgeInsets.symmetric(
              horizontal: kDefaultPadding * 1.5,
              vertical: kDefaultPadding / 2,
            ),
            child: Text(
              product.description,
              style: TextStyle(color: Colors.white, fontSize: 19.0),
            ),
          ),
          SizedBox(height: 20),

          Center(
            child: ElevatedButton.icon(
              onPressed: () {
                Provider.of<CartProvider>(context, listen: false).add(product);

                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text("تمت الإضافة للسلة 🛒")));
              },
              icon: Icon(Icons.shopping_cart),
              label: Text("إضافة للسلة"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
            ),
          ),

          SizedBox(height: 20),
          Center(
            child: ElevatedButton.icon(
              onPressed: () {
                Provider.of<CartProvider>(
                  context,
                  listen: false,
                ).toggleFavorite(product);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("تمت الإضافة للمفضلة ❤️")),
                );
              },
              icon: Icon(Icons.favorite),
              label: Text("إضافة للمفضلة"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
            ),
          ),
          // SizedBox(height: 20),

          // Center(
          //   child: ElevatedButton(
          //     onPressed: () {
          //       Navigator.pop(context, "تم اختيار المنتج");
          //     },
          //     style: ElevatedButton.styleFrom(
          //       padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
          //     ),
          //     child: Text("تأكيد والرجوع"),
          //   ),
          // ),

          // SizedBox(height: 20),
        ],
      ),
    );
  }
}
