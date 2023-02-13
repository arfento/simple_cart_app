import 'package:flutter/material.dart';
import 'package:simple_cart_app/models/product.dart';

class ProductScreen extends StatefulWidget {
  final Product? product;
  const ProductScreen({Key? key, required this.product}) : super(key: key);

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
