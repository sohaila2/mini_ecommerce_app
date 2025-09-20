import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../product/data/models/product_model.dart';
import '../../data/models/cart_item_model.dart';
part 'cart_cubit.freezed.dart';

@freezed
class CartState with _$CartState {
  const factory CartState.initial() = CartInitial;
  const factory CartState.updated(List<CartItem> items) = CartUpdated;
}

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(const CartState.initial());

  static CartCubit get get => getIt();
  static CartCubit of(BuildContext context) => context.read<CartCubit>();

  List<CartItem> cartItems = [];

  final double shippingFee = 0.00;
  final double taxes = 0.00;

  int get cartItemCount =>
      cartItems.fold(0, (sum, item) => sum + item.quantity);

  double get subtotal =>
      cartItems.fold(0.0, (sum, item) => sum + item.totalPrice);

  double get total => subtotal + shippingFee + taxes;

  bool isInCart(ProductModel product) {
    return cartItems.any((item) => item.product.id == product.id);
  }

  void addToCart(ProductModel product) {
    final index = cartItems.indexWhere((item) => item.product.id == product.id);

    if (index != -1) {
      cartItems[index].quantity++;
    } else {
      cartItems.add(CartItem(product: product));
    }

    emit(CartState.updated(List.from(cartItems)));
  }

  void removeFromCart(ProductModel product) {
    cartItems.removeWhere((item) => item.product.id == product.id);
    emit(CartState.updated(List.from(cartItems)));
  }

  void increaseQuantity(ProductModel product) {
    final index = cartItems.indexWhere((item) => item.product.id == product.id);
    if (index != -1) {
      final updatedItem = cartItems[index].copyWith(
        quantity: cartItems[index].quantity + 1,
      );

      cartItems[index] = updatedItem;
      emit(CartState.updated(List.from(cartItems)));
    }
  }

  void decreaseQuantity(ProductModel product) {
    final index = cartItems.indexWhere((item) => item.product.id == product.id);
    if (index != -1) {
      if (cartItems[index].quantity > 1) {
        final updatedItem = cartItems[index].copyWith(
          quantity: cartItems[index].quantity - 1,
        );
        cartItems[index] = updatedItem;
      } else {
        cartItems.removeAt(index);
      }
      emit(CartState.updated(List.from(cartItems)));
    }
  }
}
