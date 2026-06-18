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
          // استخدام Image.network بدلاً من Image.asset
          Image.network(
            image,
            height: size.width * 0.75,
            width: size.width * 0.75,
            fit: BoxFit.contain,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                      : null,
                ),
              );
            },
            errorBuilder: (context, error, stackTrace) {
              return Center(
                child: Icon(
                  Icons.image_not_supported,
                  size: 80,
                  color: Colors.grey,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
