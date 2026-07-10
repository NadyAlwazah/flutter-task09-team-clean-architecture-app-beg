import 'dart:convert';

import 'package:flutter_task09_team_clean_architecture_app_beg/core/constant/app_key.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/core/services/shared_preferences_helper.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/features/home/data/models/product_model.dart';

class CartLocalDataSource {
  // حفظ السلة كاملة
  Future<void> saveCart(List<ProductModel> cartItems) async {
    final jsonList = cartItems.map((item) => jsonEncode(item.toMap())).toList();

    await SharedPreferencesHelper.saveList(AppKey.cartKey, jsonList);
  }

  // استرجاع السلة كاملة
  Future<List<ProductModel>> getCart() async {
    final jsonList = await SharedPreferencesHelper.getList(AppKey.cartKey);
    if (jsonList == null) return [];

    return jsonList
        .map((item) => ProductModel.fromMap(jsonDecode(item)))
        .toList();
  }

  // إضافة عنصر واحد للسلة
  Future<void> addToCart(ProductModel product) async {
    final jsonList =
        await SharedPreferencesHelper.getList(AppKey.cartKey) ?? [];

    jsonList.add(jsonEncode(product.toMap()));

    await SharedPreferencesHelper.saveList(AppKey.cartKey, jsonList);
  }

  // حذف عنصر واحد من السلة حسب id
  Future<void> removeFromCart(int id) async {
    final jsonList = await SharedPreferencesHelper.getList(AppKey.cartKey);
    if (jsonList == null) return;

    jsonList.removeWhere((item) {
      final decoded = jsonDecode(item);
      return decoded["id"] == id;
    });

    await SharedPreferencesHelper.saveList(AppKey.cartKey, jsonList);
  }

  // حذف السلة كاملة
  Future<void> clearCart() async {
    await SharedPreferencesHelper.remove(AppKey.cartKey);
  }
}
