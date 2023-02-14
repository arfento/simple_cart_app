import 'package:flutter/material.dart';
import 'package:simple_cart_app/models/category.dart';
import 'package:simple_cart_app/models/product.dart';
import 'package:simple_cart_app/widgets/custom_app_bar.dart';
import 'package:simple_cart_app/widgets/product_card.dart';

class CatalogScreen extends StatefulWidget {
  static const String routeName = '/catalog';
  final Category? category;
  const CatalogScreen({Key? key, this.category}) : super(key: key);

  @override
  _CatalogScreenState createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  @override
  Widget build(BuildContext context) {
    final List<Product> categoryProducts = Product.products
        .where((product) => product.category == widget.category?.name)
        .toList();

    return Scaffold(
      appBar: CustomAppBar(title: widget.category!.name),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 16,
        ),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.15,
          ),
          itemBuilder: (context, index) {
            return Center(
              child: ProductCard(
                product: categoryProducts[index],
                widthFactor: 2.2,
              ),
            );
          },
          itemCount: categoryProducts.length,
        ),
      ),
    );
  }
}
