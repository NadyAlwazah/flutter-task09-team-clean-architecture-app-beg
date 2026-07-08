import 'dart:convert';

import 'package:flutter_task09_team_clean_architecture_app_beg/core/app/routes.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/core/constant/app_key.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/features/home/data/models/product_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesServices {
  late SharedPreferences sharedPrefrences;

  Future init() async {
    // sharedPrefrences = await SharedPreferences.getInstance();

    // قراءة التوكن
    String? token = await SharedPreferencesServices.getAccessToken();

    // تمرير التوكن للروتر
    AppRouter.initRouter(isLoggedIn: token != null);
  }

  static Future<void> saveStringValue(String key, String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  static Future<String?> getStringValue(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  static Future<void> saveAccessToken(String token) async {
    await saveStringValue(AppKey.token, token);
  }

  static Future<String?> getAccessToken() async {
    return getStringValue(AppKey.token);
  }

  static Future<void> clearTokens() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(AppKey.token);
  }

  // Cart Storage

  static Future<void> saveCart(List<ProductModel> cartItems) async {
    final prefs = await SharedPreferences.getInstance();

    List<String> jsonList = cartItems
        .map((item) => jsonEncode(item.toMap()))
        .toList();

    await prefs.setStringList(AppKey.cartKey, jsonList);
  }

  // استرجاع السلة كاملة
  static Future<List<ProductModel>> getCart() async {
    final prefs = await SharedPreferences.getInstance();

    final jsonList = prefs.getStringList(AppKey.cartKey);
    if (jsonList == null) return [];

    return jsonList
        .map((item) => ProductModel.fromMap(jsonDecode(item)))
        .toList();
  }

  // إضافة عنصر واحد للسلة
  static Future<void> addToCart(ProductModel product) async {
    final prefs = await SharedPreferences.getInstance();

    final jsonList = prefs.getStringList(AppKey.cartKey) ?? [];

    jsonList.add(jsonEncode(product.toMap()));

    await prefs.setStringList(AppKey.cartKey, jsonList);
  }

  // حذف عنصر واحد من السلة
  static Future<void> removeFromCart(int id) async {
    final prefs = await SharedPreferences.getInstance();

    final jsonList = prefs.getStringList(AppKey.cartKey);
    if (jsonList == null) return;

    jsonList.removeWhere((item) {
      final decoded = jsonDecode(item);
      return decoded["id"] == id;
    });

    await prefs.setStringList(AppKey.cartKey, jsonList);
  }

  // حذف السلة كاملة
  static Future<void> clearCart() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(AppKey.cartKey);
  }
}
