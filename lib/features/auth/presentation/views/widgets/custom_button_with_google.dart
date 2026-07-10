import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/core/utils/app_colors.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/core/utils/assets.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/core/utils/styles.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/core/widgets/app_loader.dart';

class CustomButtonWithGoogle extends StatelessWidget {
  final String? text;
  final VoidCallback? onPressed;
  final bool isLoading;

  const CustomButtonWithGoogle({
    super.key,
    this.text,
    this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.backgroundColor,
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14.r),
        ),
      ),
      child: isLoading
          ? const Center(
              child: SizedBox(width: 20, height: 20, child: AppLoader()),
            )
          : Row(
              children: [
                const Spacer(),
                SvgPicture.asset(
                  AssetsData.googleSvg,
                  width: 22.r,
                  height: 22.r,
                ),
                const SizedBox(width: 14),
                Text(
                  text!,
                  style: Styles.textStyle14W600Raleway.copyWith(
                    color: AppColors.appBarTitleColor,
                  ),
                ),
                const Spacer(),
              ],
            ),
    );
  }
}
