import 'package:electronic_stor/constansts.dart';
import 'package:electronic_stor/models/product.dart';
import 'package:electronic_stor/widgets/details/details_body.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final Product product;

  const DetailsScreen({super.key, required this.product});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: detailsAppar(context),
      body: DetailsBody(product: product),
    );
  }

  AppBar detailsAppar(BuildContext context) {
    return AppBar(
      backgroundColor: kBackgroundColor,
      elevation: 0,
      leading: IconButton(
        padding: EdgeInsets.only(right: kDefaultPadding),
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context, "تم الرجوع من صفحة التفاصيل");
        },
      ),
      centerTitle: false,
      title: Text("رجوع", style: Theme.of(context).textTheme.bodyMedium),
    );
  }
}
