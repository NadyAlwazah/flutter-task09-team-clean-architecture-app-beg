import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/core/utils/styles.dart';

class OnboardPageContent extends StatelessWidget {
  final Map<String, dynamic> item;
  final int index;

  const OnboardPageContent({
    super.key,
    required this.item,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final double smileTop = index == 0 ? 125.0 : (index == 1 ? 80.0 : 60.0);
    final double smileOpacity = index == 0 ? 0.22 : (index == 1 ? 0.50 : 0.70);
    final double smileWidth = index == 2 ? 75.0 : 40.0;
    return Stack(
      children: [
        if (item["topHighlight"] != null)
          Positioned(
            top: 75.h,
            left: 55.w,
            child: SvgPicture.asset(
              item["topHighlight"],
              width: 24.w,
              height: 24.h,
              color: Colors.white,
            ),
          ),

        if (item["smileAsset"] != null)
          Positioned(
            top: smileTop.h,
            left: index == 1 ? null : (index == 2 ? 65.w : null),
            right: index == 1 ? 30.w : (index == 2 ? null : 55.w),
            child: Opacity(
              opacity: smileOpacity,
              child: SvgPicture.asset(item["smileAsset"], width: smileWidth.w),
            ),
          ),

        if (item["decorAssetLeft"] != null)
          Positioned(
            top: index == 1 ? 75.h : null,
            bottom: index == 1 ? null : 100.h,
            left: index == 1 ? 30.w : 10.w,
            child: Opacity(
              opacity: index == 1 ? 0.80 : 0.22,
              child: Transform.rotate(
                angle: index == 1
                    ? -15 * (math.pi / 180)
                    : 250 * (math.pi / 180),
                child: SvgPicture.asset(item["decorAssetLeft"], width: 100.w),
              ),
            ),
          ),

        if (item["decorAssetRight"] != null)
          Positioned(
            bottom: 160.h,
            right: -3.w,
            left: 165,
            child: Opacity(
              opacity: 0.22,
              child: Transform.rotate(
                angle: 2 * (math.pi / 180),
                child: SvgPicture.asset(item["decorAssetRight"], width: 100.w),
              ),
            ),
          ),

        Positioned(
          top: 0,
          bottom: 120.h,
          left: 24.w,
          right: 24.w,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                item["title"],
                textAlign: TextAlign.center,
                style: Styles.textStyle34Bold.copyWith(
                  color: Colors.white,
                  height: 1.2,
                ),
              ),
              if (item["waveLine"] != null) ...[
                SizedBox(height: 16.h),
                SvgPicture.asset(item["waveLine"], width: 125.w),
              ],
              if (item["subtitle"].toString().isNotEmpty) ...[
                SizedBox(height: 40.h),
                Text(
                  item["subtitle"],
                  textAlign: TextAlign.center,
                  style: Styles.textStyle16W400Poppins.copyWith(height: 1.5),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
