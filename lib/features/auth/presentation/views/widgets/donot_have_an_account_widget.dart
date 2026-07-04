import 'package:flutter/material.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/core/app/routes.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/core/utils/app_colors.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/styles.dart';

class DonotHaveAnAccountWidget extends StatelessWidget {
  const DonotHaveAnAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "New User? ",
          style: Styles.textStyle16W500Raleway.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        GestureDetector(
          onTap: () {
            GoRouter.of(context).push(AppRouter.kSignup);
          },
          child: Text(
            "Create Account",
            style: Styles.textStyle16W500Raleway.copyWith(
              color: AppColors.linkTextColor,
            ),
          ),
        ),
      ],
    );
  }
}
