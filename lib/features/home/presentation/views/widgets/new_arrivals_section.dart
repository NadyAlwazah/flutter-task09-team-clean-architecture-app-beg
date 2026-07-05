import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/core/utils/app_colors.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/core/utils/assets.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/core/utils/styles.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/features/home/presentation/views/widgets/new_arrival_star.dart';

class NewArrivalsSection extends StatelessWidget {
  const NewArrivalsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// العنوان
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "New Arrivals",
              style: Styles.textStyle16W600.copyWith(
                color: AppColors.textPrimary,
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Text("See all", style: Styles.textStyle12W500Poppins),
            ),
          ],
        ),

        SizedBox(height: 16.h),

        /// البطاقة
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: double.infinity,
              height: 95.h,
              decoration: BoxDecoration(
                color: AppColors.backgroundColorItem,
                borderRadius: BorderRadius.circular(16.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.04),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),

              /// النصوص
              child: Padding(
                padding: EdgeInsets.only(left: 22.w, top: 18.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Summer Sale",
                      style: Styles.textStyle12W500Raleway.copyWith(
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '15% OFF',
                      style: TextStyle(
                        height: 1.02,
                        fontFamily: 'FuturaPTCond',
                        fontWeight: FontWeight.w900,
                        color: const Color(0xFF674DC5),
                        fontSize: 40.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // النجوم
            const NewArrivalStar(top: 4, left: 130),
            const NewArrivalStar(top: 60, left: 8),
            const NewArrivalStar(top: 66, left: 158),
            const NewArrivalStar(top: 15, right: 9.52),

            // NEW كلمة
            Positioned(
              top: 12.h,
              left: 176.w,
              child: SvgPicture.asset(
                AssetsData.newSvg,
                width: 26.r,
                height: 26.r,
              ),
            ),

            // صورة التيشيرت
            Positioned(
              right: 19.76.w,
              top: -24.24.h,
              child: Image.asset(AssetsData.tShirt),
            ),
          ],
        ),
      ],
    );
  }
}
