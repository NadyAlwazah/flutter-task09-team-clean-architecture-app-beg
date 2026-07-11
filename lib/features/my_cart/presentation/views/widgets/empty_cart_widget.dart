import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/core/utils/app_colors.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/core/utils/styles.dart';

class EmptyCartWidget extends StatelessWidget {
  const EmptyCartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.shopping_cart_outlined,
              size: 80.r,
              color: AppColors.primary,
            ),
            const SizedBox(height: 20),
            Text(
              "Your cart is empty",
              style: Styles.textStyle16W600Raleway.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
