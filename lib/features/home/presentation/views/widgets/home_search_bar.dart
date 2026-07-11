import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/core/utils/app_colors.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/core/utils/assets.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/core/utils/styles.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 52.h,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF000000).withValues(alpha: 0.04),
                  offset: const Offset(0, 4),
                  blurRadius: 4,
                  spreadRadius: 0,
                ),
              ],
            ),
            child: TextFormField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 16),
                hintText: 'Looking for ......',
                hintStyle: Styles.textStyle12Grey,
                filled: true,
                fillColor: AppColors.backgroundColorItem,
                //! إزالة الحدود الافتراضية
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14.r),
                  borderSide: BorderSide.none,
                ),

                //! لتحديد مساحة مناسبة للأيقونة
                prefixIconConstraints: BoxConstraints(
                  minWidth: 40.w,
                  minHeight: 40.h,
                ),

                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 26, right: 12),
                  child: SvgPicture.asset(
                    AssetsData.iconSearchSvg,
                    width: 24.r,
                    height: 24.r,
                    colorFilter: const ColorFilter.mode(
                      AppColors.textSecondary,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),

        const SizedBox(width: 10),

        GestureDetector(
          onTap: () {},
          child: CircleAvatar(
            radius: 27.r,
            backgroundColor: AppColors.primary,
            child: SvgPicture.asset(
              AssetsData.iconFilterSvg,
              width: 24.r,
              height: 24.r,
            ),
          ),
        ),
      ],
    );
  }
}
