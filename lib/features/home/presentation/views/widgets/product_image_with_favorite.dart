import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/core/utils/assets.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/core/widgets/app_loader.dart';

class ProductImageWithFavorite extends StatelessWidget {
  final String imageUrl;
  final bool isFavorite;
  final VoidCallback onFavoriteTap;

  const ProductImageWithFavorite({
    super.key,
    required this.imageUrl,
    required this.isFavorite,
    required this.onFavoriteTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            width: 95.r,
            height: 95.r,
            fit: BoxFit.contain,
            placeholder: (context, url) => const Center(child: AppLoader()),
            errorWidget: (context, url, error) =>
                const Center(child: Icon(Icons.error)),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          child: GestureDetector(
            onTap: onFavoriteTap,
            child: SvgPicture.asset(
              isFavorite
                  ? AssetsData.iconFavoriteRedSvg
                  : AssetsData.iconFavoriteSvg,
              width: 14.r,
              height: 14.r,
            ),
          ),
        ),
      ],
    );
  }
}
