import 'package:flutter/material.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/core/widgets/favorite_provider.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/features/favourite/presentation/views/widgets/product_card_favourite.dart';
import 'package:provider/provider.dart';

class FavouriteViewBody extends StatelessWidget {
  const FavouriteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    // نستخدم Consumer لضمان الوصول للـ Provider بشكل صحيح
    return Consumer<FavoriteProvider>(
      builder: (context, favoriteProvider, child) {
        final favoriteItems = favoriteProvider.favorites;

        if (favoriteItems.isEmpty) {
          return const Center(
            child: Text(
              "No Specific User-Favorites found for current UID.",
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
            ),
          );
        }

        return GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          itemCount: favoriteItems.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: (size.width / 2) / (size.height * 0.33),
          ),
          itemBuilder: (context, index) {
            return FavouriteProductCard(product: favoriteItems[index]);
          },
        );
      },
    );
  }
}
