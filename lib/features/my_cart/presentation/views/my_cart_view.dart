import 'package:flutter/material.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/core/app/routes.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/core/utils/app_colors.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/core/utils/styles.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/core/widgets/custom_app_bar.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/features/my_cart/presentation/views/widgets/my_cart_view_body.dart';
import 'package:go_router/go_router.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(
          title: "My Cart",
          textStyle: Styles.textStyle16W600Raleway.copyWith(
            color: AppColors.appBarTitleColor,
          ),
          onTapLeading: () {
            //!!!
            // GoRouter.of(context).push(AppRouter.kBottomBar);
            context.go(AppRouter.kBottomBar);
          },
        ),
        const Expanded(child: MyCartViewBody()),
      ],
    );
  }
}
