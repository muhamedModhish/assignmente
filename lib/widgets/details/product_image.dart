import 'package:electronic_stor/constansts.dart';
import 'package:flutter/material.dart';


class ProductImage extends StatelessWidget {
  const ProductImage({required this.image, super.key, required this.size});

  final Size size;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: kDefaultPadding),
      height: size.width * 0.8,
      // color: Colors.black12,
      child: Stack(
        alignment: AlignmentGeometry.bottomCenter,
        children: [
          Container(
            height: size.width * 0.7,
            width: size.width * 0.7,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
          Image.asset(image,
          // s/hedest.jpg,
            height: size.width * 0.75,
            width: size.width * 0.75,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
