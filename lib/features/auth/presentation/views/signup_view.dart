import 'package:flutter/material.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/core/utils/app_colors.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/core/widgets/custom_app_bar.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/features/auth/presentation/views/widgets/signup_view_body.dart';
import 'package:go_router/go_router.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColorItem,
      appBar: CustomAppBar(onTapLeading: () => context.pop()),
      body: const SignupViewBody(),
    );
  }
}
