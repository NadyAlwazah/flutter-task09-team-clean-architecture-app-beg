import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/core/utils/app_colors.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/core/utils/styles.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/features/home/data/models/product_model.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/features/home/presentation/views/widgets/product_image_with_favorite.dart';

class ProductCard extends StatefulWidget {
  final ProductModel product;

  const ProductCard({super.key, required this.product});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
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
                // الصورة + المفضلة
                Expanded(
                  child: ProductImageWithFavorite(
                    imageUrl: widget.product.image,
                    isFavorite: isFavorite,
                    onFavoriteTap: () {
                      setState(() => isFavorite = !isFavorite);
                    },
                  ),
                ),

                SizedBox(height: 8.h),

                /// BEST SELLER
                Text(
                  'BEST SELLER',
                  style: Styles.textStyle12W500Poppins.copyWith(
                    color: AppColors.primary,
                  ),
                ),

                SizedBox(height: 4.h),

                /// اسم المنتج
                Text(
                  widget.product.title,
                  // maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Styles.textStyle14W600Raleway.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),

                SizedBox(height: 8.h),

                /// السعر
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

        /// زر الإضافة
        Positioned(
          right: 0,
          bottom: 0,
          child: GestureDetector(
            onTap: () {},
            child: Container(
              width: 34.w,
              height: 35.5.h,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(18.r),
                  bottomRight: Radius.circular(18.r),
                ),
              ),
              child: Center(
                child: Icon(
                  Icons.add,
                  color: AppColors.backgroundColorItem,
                  size: 16.r,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
