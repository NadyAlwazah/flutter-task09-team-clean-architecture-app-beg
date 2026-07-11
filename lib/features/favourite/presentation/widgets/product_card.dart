import 'package:flutter/material.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/domin/entities/product_entity.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/features/favourite/presentation/managers/favorite_provider.dart';
import 'package:provider/provider.dart';
import '../../../../core/utils/styles.dart';
import '../../../../core/utils/app_colors.dart';

class ProductCard extends StatelessWidget {
  final ProductEntity product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteProvider>(context);
    final isFav = favoriteProvider.isFavorite(product);

    return Container(
      decoration: BoxDecoration(
        color: AppColors.backgroundColorItem,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.015),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => favoriteProvider.toggleFavorite(product),
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                  color: AppColors.favBgRed,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  isFav ? Icons.favorite : Icons.favorite_border,
                  color: AppColors.favRed,
                  size: 16,
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Image.network(
                  product.image,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) => const Icon(
                    Icons.shopping_bag,
                    size: 50,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            if (product.isBestSeller) ...[
              Text(
                "BEST SELLER",
                style: Styles.textStyle12W500Poppins.copyWith(
                  color: AppColors.bestSellerGreen,
                  fontSize: 11,
                ),
              ),
              const SizedBox(height: 2),
            ],
            Text(
              product.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Styles.textStyle13W500Raleway.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$${product.price}",
                  style: Styles.textStyle16W500Poppins.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: product.availableColors.map((colorValue) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      width: 14,
                      height: 14,
                      decoration: BoxDecoration(
                        color: Color(int.parse(colorValue)),
                        shape: BoxShape.circle,
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
