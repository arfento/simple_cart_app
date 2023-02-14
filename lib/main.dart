import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_cart_app/bloc/cart/cart_bloc.dart';
import 'package:simple_cart_app/bloc/wishlist/wishlist_bloc.dart';
import 'package:simple_cart_app/screens/catalog_screen.dart';
import 'package:simple_cart_app/screens/checkout_screen.dart';
import 'package:simple_cart_app/screens/product_screen.dart';
import 'package:simple_cart_app/screens/tabs_screen.dart';
import 'package:simple_cart_app/config/theme.dart';
import 'package:simple_cart_app/screens/wishlist_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CartBloc()..add(CartStarted()),
        ),
        BlocProvider(
          create: (context) => WishlistBloc()..add(StartWishlistProduct()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Cart App',
        theme: theme(),
        home: const TabsScreen(),
        routes: {
          WishlistScreen.routeName: (context) => const WishlistScreen(),
          ProductScreen.routeName: (context) => const ProductScreen(),
          CatalogScreen.routeName: (context) => const CatalogScreen(),
          CheckoutScreen.routeName: (context) => const CheckoutScreen(),
        },
      ),
    );
  }
}
