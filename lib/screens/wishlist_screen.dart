import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_cart_app/bloc/cart/cart_bloc.dart';
import 'package:simple_cart_app/bloc/wishlist/wishlist_bloc.dart';
import 'package:simple_cart_app/widgets/custom_app_bar.dart';
import 'package:simple_cart_app/widgets/product_card.dart';

class WishlistScreen extends StatefulWidget {
  static const String routeName = '/wishlist';
  const WishlistScreen({Key? key}) : super(key: key);

  @override
  _WishlistScreenState createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Wishlist'),
      body: BlocBuilder<WishlistBloc, WishlistState>(
        builder: (context, state) {
          if (state is WishlistLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is WishlistLoaded) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1, childAspectRatio: 2.4),
              itemBuilder: (context, index) {
                return Center(
                  child: state.wishlist.products.length == 0
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            const Icon(Icons.shopping_cart_outlined),
                            Text(
                              "Your Cart is empty",
                              style: Theme.of(context).textTheme.headline3,
                            ),
                          ],
                        )
                      : ProductCard(
                          product: state.wishlist.products[index],
                          isWishlist: true,
                          widthFactor: 1.1,
                        ),
                );
              },
              itemCount: state.wishlist.products.length,
            );
          } else {
            return const Center(
              child: Text("Someting went wrong"),
            );
          }
        },
      ),
    );
  }
}
