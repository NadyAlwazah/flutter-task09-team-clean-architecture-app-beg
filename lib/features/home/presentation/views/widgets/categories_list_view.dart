import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/core/utils/app_colors.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/core/utils/styles.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    //! API قائمة مؤقتة لحين إضافة الـ
    final List<String> tempCategories = [
      "Man",
      "Woman",
      "Child",
      "Shoes",
      "Accessories",
      "Sports",
      "Beauty",
    ];

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Select Category',
          style: Styles.textStyle16W600Raleway.copyWith(
            color: AppColors.textPrimary,
          ),
        ),

        SizedBox(height: 12.h),
        SizedBox(
          height: 40.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: tempCategories.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 16),
                child: _buildCategoryItem(tempCategories[index]),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryItem(String title) {
    return Container(
      width: 108.w,
      height: 40.h,
      decoration: BoxDecoration(
        color: AppColors.backgroundColorItem,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF000000).withValues(alpha: 0.04),
            offset: const Offset(0, 4),
            blurRadius: 4,
          ),
        ],
      ),
      child: Center(child: Text(title, style: Styles.textStyle12W400Poppins)),
    );
  }
}
