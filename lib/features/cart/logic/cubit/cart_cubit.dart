import 'package:cartella/features/home/logic/entities/product.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  final List<Product> cartItems = [];

  void addToCart(Product product) {
    cartItems.add(product);
    emit(CartUpdated(cartItems.length));
  }

  void removeFromCart(Product product) {
    cartItems.remove(product);
    emit(CartUpdated(cartItems.length));
  }

  int get totalPrice {
    int total = 0;
    for (var item in cartItems) {
      total += item.price;
    }
    return total;
  }
}
