import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_task09_team_clean_architecture_app_beg/core/services/shared_preferences_services.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/data/models/product_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  List<ProductModel> cartItems = [];

  Future<void> loadCart() async {
    emit(CartLoading());
    //cartItems = await SharedPreferencesServices.getCart();
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

    // await SharedPreferencesServices.saveCart(cartItems);
    emit(CartLoaded(cartItems));
    return newProduct;
  }

  Future<void> increaseQuantity(int id) async {
    final index = cartItems.indexWhere((item) => item.id == id);
    if (index != -1) {
      cartItems[index].quantity++;
      // await SharedPreferencesServices.saveCart(cartItems);
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

      //await SharedPreferencesServices.saveCart(cartItems);
      emit(CartLoaded(cartItems));
    }
  }

  Future<void> removeFromCart(int id) async {
    cartItems.removeWhere((item) => item.id == id);
    //  await SharedPreferencesServices.saveCart(cartItems);
    emit(CartLoaded(cartItems));
  }
}
