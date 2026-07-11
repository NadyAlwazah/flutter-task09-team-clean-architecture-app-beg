import 'package:flutter/material.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/features/favourite/presentation/data/domin/entities/product_entity.dart';

class FavoriteProvider extends ChangeNotifier {
  // أصبح الـ ID متغيراً ونقوم بتهئيته بقيمة افتراضية أو null
  String _currentUserId = "user_byte_boutique_123";

  // دالة لتغيير المستخدم الحالي في أي وقت
  void setCurrentUserId(String newUserId) {
    _currentUserId = newUserId;
    notifyListeners(); // نحدث الواجهة عند تغيير المستخدم
  }

  // خريطة لتخزين مفضلات كل مستخدم
  final Map<String, List<ProductEntity>> _userFavorites = {};

  // نجلب المفضلة بناءً على الـ ID الحالي
  List<ProductEntity> get favorites => _userFavorites[_currentUserId] ?? [];

  bool isFavorite(ProductEntity product) {
    return favorites.any((element) => element.id == product.id);
  }

  void toggleFavorite(ProductEntity product) {
    if (!_userFavorites.containsKey(_currentUserId)) {
      _userFavorites[_currentUserId] = [];
    }

    final isExist = _userFavorites[_currentUserId]!.any(
      (element) => element.id == product.id,
    );

    if (isExist) {
      _userFavorites[_currentUserId]!.removeWhere(
        (element) => element.id == product.id,
      );
    } else {
      _userFavorites[_currentUserId]!.add(product);
    }
    notifyListeners();
  }
}
