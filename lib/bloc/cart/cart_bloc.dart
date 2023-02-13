import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:simple_cart_app/models/cart.dart';
import 'package:simple_cart_app/models/product.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartLoading()) {
    on<CartStarted>(_mapCartStartedEventToState);

    on<CartProductAdded>(
      (event, emit) {
        final state = this.state;
        try {
          if (state is CartLoaded) {
            emit(
              CartLoaded(
                cart: Cart(
                  products: List.from(state.cart!.products)..add(event.product),
                ),
              ),
            );
          }
        } catch (_) {
          emit(CartError());
        }
      },
    );

    on<CartProductRemoved>((event, emit) {
      final state = this.state;
      try {
        if (state is CartLoaded) {
          emit(CartLoaded(
              cart: Cart(
                  products: List.from(state.cart!.products)
                    ..remove(event.product))));
        }
      } catch (e) {
        emit(CartError());
      }
    });
  }
  _mapCartStartedEventToState(event, Emitter<CartState> emit) async {
    emit(CartLoading());
    try {
      await Future.delayed(const Duration(seconds: 1));
    } catch (_) {}
  }
}
