import 'package:electronic_stor/constansts.dart';
import 'package:electronic_stor/models/product.dart';
import 'package:electronic_stor/screens/details.screen.dart';
// import 'package:electronic_stor/widgets/details/details_body.dart';
import 'package:electronic_stor/widgets/product_cart.dart';
import 'package:flutter/material.dart';
// import 'package:electronic_stor/models/product.dart';

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Column(
        children: [
          SizedBox(height: kDefaultPadding / 2),
          Expanded(
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 70.0),
                  decoration: BoxDecoration(
                    color: kBackgroundColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                ),
                ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) => ProductCard(
                    itemIndex: index,
                    product: products[index],
                    press: () async {
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DetailsScreen(product: products[index]),
                        ),
                      );

                      if (result != null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              result.toString(),
                              style: TextStyle(fontSize: 16),
                            ),
                            backgroundColor: Colors.green,
                          ),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
