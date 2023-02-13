import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:simple_cart_app/models/category.dart';
import 'package:simple_cart_app/models/product.dart';
import 'package:simple_cart_app/widgets/hero_carousel.dart';
import 'package:simple_cart_app/widgets/product_carousel.dart';
import 'package:simple_cart_app/widgets/section_title.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String routeName = '/';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CarouselSlider(
              items: Category.categories
                  .map((category) => HeroCarousel(category: category))
                  .toList(),
              options: CarouselOptions(
                aspectRatio: 1.5,
                viewportFraction: 0.9,
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
                enableInfiniteScroll: true,
              ),
            ),
            const SectionTitle(
              title: "Recommended",
            ),
            ProductCarousel(
              product: Product.products
                  .where((element) => element.isRecommended)
                  .toList(),
            ),
            SectionTitle(title: "Most Popular"),
            ProductCarousel(
              product: Product.products
                  .where((element) => element.isPopular)
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
