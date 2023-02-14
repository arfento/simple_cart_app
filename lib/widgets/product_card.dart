import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_cart_app/bloc/cart/cart_bloc.dart';
import 'package:simple_cart_app/bloc/wishlist/wishlist_bloc.dart';
import 'package:simple_cart_app/models/product.dart';
import 'package:simple_cart_app/screens/product_screen.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final double widthFactor;
  final bool? isWishlist;

  const ProductCard({
    Key? key,
    required this.product,
    this.widthFactor = 2.5,
    this.isWishlist = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double widthValue = MediaQuery.of(context).size.width / widthFactor;
    return InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ProductScreen(product: product),
          ));
        },
        child: Stack(children: [
          SizedBox(
            height: 150,
            width: widthValue,
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 10,
            left: 5,
            child: Container(
              height: 80,
              width: MediaQuery.of(context).size.width / 2.5,
              decoration: BoxDecoration(
                color: Colors.black.withAlpha(50),
              ),
            ),
          ),
          Positioned(
              bottom: 5,
              left: 5,
              child: Container(
                height: 70,
                width: MediaQuery.of(context).size.width / widthFactor - 10,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                ),
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              product.name,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5
                                  ?.copyWith(color: Colors.white),
                            ),
                            Text(
                              '\$${product.price.toString()}',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  ?.copyWith(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      BlocBuilder<CartBloc, CartState>(
                          builder: (context, state) {
                        if (state is CartLoading) {
                          return Center(child: CircularProgressIndicator());
                        }
                        if (state is CartLoaded) {
                          return Expanded(
                            child: IconButton(
                              icon: Icon(Icons.add_circle, color: Colors.white),
                              onPressed: () {
                                context
                                    .read<CartBloc>()
                                    .add(CartProductAdded(product));
                              },
                            ),
                          );
                        } else {
                          return Text('Something went wrong.');
                        }
                      }),
                      isWishlist!
                          ? Expanded(
                              child: BlocBuilder<WishlistBloc, WishlistState>(
                                builder: (context, state) {
                                  return IconButton(
                                    icon: Icon(
                                      Icons.delete,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      BlocProvider.of<WishlistBloc>(context)
                                          .add(
                                        RemoveWishlistProduct(product: product),
                                      );
                                      // Fluttertoast.showToast(
                                      //   msg: "Item deleted from wishlist.",
                                      //   toastLength: Toast.LENGTH_SHORT,
                                      //   gravity: ToastGravity.BOTTOM,
                                      //   timeInSecForIosWeb: 1,
                                      //   backgroundColor: Colors.grey,
                                      //   textColor: Colors.black,
                                      //   fontSize: 16.0,
                                      // );
                                    },
                                  );
                                },
                              ),
                            )
                          : SizedBox(),
                    ],
                  ),
                ),
              ))
        ]));
  }
}
