import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:simple_cart_app/models/product.dart';
import 'package:simple_cart_app/models/wishlist.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistLoading()) {
    on<StartWishlistProduct>((event, emit) async {
      emit(WishlistLoading());
      try {
        await Future.delayed(const Duration(seconds: 1));
        emit(const WishlistLoaded());
      } catch (_) {}
    });
    on<AddWishlistProduct>((event, emit) {
      final state = this.state;
      if (state is WishlistLoaded) {
        try {
          emit(WishlistLoaded(
              wishlist: Wishlist(
                  products: List.from(state.wishlist.products)
                    ..add(event.product!))));
        } catch (_) {
          emit(WishlistError());
        }
      } else {
        emit(WishlistError());
      }
    });
    on<RemoveWishlistProduct>((event, emit) {
      final state = this.state;
      if (state is WishlistLoaded) {
        try {
          emit(WishlistLoaded(
              wishlist: Wishlist(
                  products: List.from(state.wishlist.products)
                    ..remove(event.product!))));
        } catch (_) {
          emit(WishlistError());
        }
      } else {
        emit(WishlistError());
      }
    });
  }
}
