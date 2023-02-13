import 'package:flutter/material.dart';
import 'package:simple_cart_app/models/category.dart';

class CatalogScreen extends StatefulWidget {
  static const String routeName = '/catalog';
  const CatalogScreen({Key? key, this.category}) : super(key: key);

  final Category? category;
  @override
  _CatalogScreenState createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
