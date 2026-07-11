import 'package:flutter/material.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/features/favourite/presentation/data/managers/favorite_provider.dart';
import 'package:provider/provider.dart';
import 'product_card.dart';

class FavouriteViewBody extends StatelessWidget {
  const FavouriteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteProvider>(context);
    final favoriteItems = favoriteProvider.favorites;
    final size = MediaQuery.of(context).size;

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
        return ProductCard(product: favoriteItems[index]);
      },
    );
  }
}
