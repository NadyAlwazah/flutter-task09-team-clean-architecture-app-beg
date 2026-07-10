import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/core/utils/app_colors.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/core/utils/assets.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/core/utils/styles.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,

      backgroundColor: AppColors.backgroundColor,
      elevation: 0,
      // leading: IconButton(
      //   padding: EdgeInsets.only(left: 20.w),
      //   onPressed: () {
      //     Scaffold.of(context).openDrawer();
      //   },
      //   icon: SvgPicture.asset(
      //     AssetsData.iconMenuSvg,
      //     width: 25.71.w,
      //     height: 18.h,
      //   ),
      // ),
      leading: Builder(
        builder: (context) {
          return IconButton(
            padding: EdgeInsets.only(left: 20.w),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: SvgPicture.asset(
              AssetsData.iconMenuSvg,
              width: 25.71.w,
              height: 18.h,
            ),
          );
        },
      ),

      title: Stack(
        clipBehavior: Clip.none,
        children: [
          Text(
            "Explore",
            style: Styles.textStyle32Bold.copyWith(
              color: AppColors.appBarTitleColor,
            ),
          ),
          Positioned(
            left: -17.w,
            top: -6.h,
            child: SvgPicture.asset(AssetsData.iconHighlightTopSvg),
          ),
        ],
      ),
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.all(8.w),
                child: CircleAvatar(
                  backgroundColor: AppColors.backgroundColorItem,
                  radius: 22.r,
                  child: SvgPicture.asset(
                    AssetsData.iconBagSvg,
                    width: 24.r,
                    height: 24.r,
                  ),
                ),
              ),
              Positioned(
                top: 10.h,
                right: 10.w,
                child: CircleAvatar(backgroundColor: Colors.red, radius: 4.r),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
