import 'package:flutter/material.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/domin/entities/product_entity.dart';

class FavoriteProvider extends ChangeNotifier {
  final String currentUserId = "user_byte_boutique_123";

  final Map<String, List<ProductEntity>> _userFavorites = {};

  List<ProductEntity> get favorites => _userFavorites[currentUserId] ?? [];

  bool isFavorite(ProductEntity product) {
    return favorites.any((element) => element.id == product.id);
  }

  void toggleFavorite(ProductEntity product) {
    if (!_userFavorites.containsKey(currentUserId)) {
      _userFavorites[currentUserId] = [];
    }

    final isExist = _userFavorites[currentUserId]!.any(
      (element) => element.id == product.id,
    );

    if (isExist) {
      _userFavorites[currentUserId]!.removeWhere(
        (element) => element.id == product.id,
      );
    } else {
      _userFavorites[currentUserId]!.add(product);
    }
    notifyListeners();
  }
}
