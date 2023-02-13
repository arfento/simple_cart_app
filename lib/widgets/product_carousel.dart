import 'package:flutter/material.dart';
import 'package:simple_cart_app/models/product.dart';
import 'package:simple_cart_app/widgets/product_card.dart';

class ProductCarousel extends StatelessWidget {
  final List<Product>? product;
  const ProductCarousel({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: SizedBox(
        height: 165,
        child: ListView.builder(
          itemCount: product!.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 5),
              child: ProductCard(product: product![index]),
            );
          },
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}
