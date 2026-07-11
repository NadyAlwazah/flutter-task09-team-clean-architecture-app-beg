import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/features/home/data/models/product_model.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/features/my_cart/data/data_sources/cart_local_data_source.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit({required this.cartLocalDataSource}) : super(CartInitial());
  final CartLocalDataSource cartLocalDataSource;
  List<ProductModel> cartItems = [];

  Future<void> loadCart() async {
    emit(CartLoading());
    cartItems = await cartLocalDataSource.getCart();
    emit(CartLoaded(cartItems));
  }

  Future<bool> addToCart(ProductModel product) async {
    //! إذا المنتج موجود مسبقاً
    final index = cartItems.indexWhere((item) => item.id == product.id);
    bool newProduct = false;
    if (index != -1) {
      cartItems[index].quantity++;
      newProduct = false;
    } else {
      cartItems.add(product);
      newProduct = true;
    }

    await cartLocalDataSource.saveCart(cartItems);
    emit(CartLoaded(cartItems));
    return newProduct;
  }

  Future<void> increaseQuantity(int id) async {
    final index = cartItems.indexWhere((item) => item.id == id);
    if (index != -1) {
      cartItems[index].quantity++;
      await cartLocalDataSource.saveCart(cartItems);
      emit(CartLoaded(cartItems));
    }
  }

  Future<void> decreaseQuantity(int id) async {
    final index = cartItems.indexWhere((item) => item.id == id);
    if (index != -1) {
      if (cartItems[index].quantity > 1) {
        cartItems[index].quantity--;
      } else {
        cartItems.removeAt(index);
      }

      await cartLocalDataSource.saveCart(cartItems);
      emit(CartLoaded(cartItems));
    }
  }

  Future<void> removeFromCart(int id) async {
    cartItems.removeWhere((item) => item.id == id);
    await cartLocalDataSource.saveCart(cartItems);
    emit(CartLoaded(cartItems));
  }
}
