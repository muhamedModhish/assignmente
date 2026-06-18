import 'package:electronic_stor/constansts.dart';
import 'package:electronic_stor/product_provider.dart';
import 'package:electronic_stor/screens/details.screen.dart';
import 'package:electronic_stor/widgets/product_cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

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
                // استخدام Consumer لعرض المنتجات من API
                Consumer<ProductProvider>(
                  builder: (context, productProvider, child) {
                    // عرض Loading Indicator أثناء تحميل البيانات
                    if (productProvider.isLoading) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(
                              color: Colors.white,
                            ),
                            SizedBox(height: 16),
                            Text(
                              'جاري تحميل المنتجات...',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      );
                    }

                    // عرض رسالة خطأ مع زر إعادة المحاولة
                    if (productProvider.errorMessage.isNotEmpty) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.error_outline,
                              color: Colors.white,
                              size: 60,
                            ),
                            SizedBox(height: 16),
                            Text(
                              'حدث خطأ في تحميل المنتجات',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 16),
                            ElevatedButton.icon(
                              onPressed: () {
                                productProvider.loadProducts();
                              },
                              icon: Icon(Icons.refresh),
                              label: Text('إعادة المحاولة'),
                            ),
                          ],
                        ),
                      );
                    }

                    // عرض المنتجات القادمة من API
                    if (productProvider.products.isEmpty) {
                      return Center(
                        child: Text(
                          'لا توجد منتجات',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      );
                    }

                    return ListView.builder(
                      itemCount: productProvider.products.length,
                      itemBuilder: (context, index) {
                        final product = productProvider.products[index];
                        return ProductCard(
                          itemIndex: index,
                          product: product,
                          press: () async {
                            final result = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    DetailsScreen(product: product),
                              ),
                            );

                            if (!context.mounted) return;
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
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
