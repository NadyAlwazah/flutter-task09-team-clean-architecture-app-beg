import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/core/utils/app_colors.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/core/utils/styles.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/features/favourite/presentation/data/domin/entities/product_entity.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/features/home/presentation/views/widgets/product_image_with_favorite.dart';
import 'package:go_router/go_router.dart';

class FavouriteProductCard extends StatefulWidget {
  final ProductEntity product;

  const FavouriteProductCard({super.key, required this.product});

  @override
  State<FavouriteProductCard> createState() => _FavouriteProductCardState();
}

class _FavouriteProductCardState extends State<FavouriteProductCard> {
  // المفضلة تكون مفعلة دائماً في واجهة المفضلة
  bool isFavorite = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () => context.push('/details/${widget.product.id}'),
          child: Container(
            width: 157.w,
            decoration: BoxDecoration(
              color: AppColors.backgroundColorItem,
              borderRadius: BorderRadius.circular(18.r),
            ),
            child: Padding(
              padding: EdgeInsets.all(12.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ProductImageWithFavorite(
                      imageUrl: widget.product.image,
                      isFavorite: isFavorite,
                      onFavoriteTap: () =>
                          setState(() => isFavorite = !isFavorite),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'BEST SELLER',
                    style: Styles.textStyle12W500Poppins.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    widget.product.title,
                    overflow: TextOverflow.ellipsis,
                    style: Styles.textStyle14W600Raleway.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Padding(
                    padding: EdgeInsets.only(right: 40.w),
                    child: Text(
                      '\$${widget.product.price.toStringAsFixed(2)}',
                      style: Styles.textStyle14W500Poppins.copyWith(
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        // عرض الدوائر مباشرة بدون أي شروط
        Positioned(right: 0, bottom: 0, child: _buildColorCircles()),
      ],
    );
  }

  Widget _buildColorCircles() {
    return Padding(
      padding: EdgeInsets.only(right: 12.w, bottom: 12.h),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: AppColors.productColors.take(2).map((color) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 3.w),
            width: 16.w,
            height: 16.w,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 1.5),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 2,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
