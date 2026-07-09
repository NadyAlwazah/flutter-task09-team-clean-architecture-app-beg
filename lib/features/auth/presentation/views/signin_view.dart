import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/core/utils/app_colors.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/core/widgets/custom_app_bar.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/features/auth/data/manager/signin_cubit/signin_cubit.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/features/auth/presentation/views/widgets/signin_view_body.dart';

class SigninView extends StatelessWidget {
  const SigninView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColorItem,
      appBar: const CustomAppBar(isAuth: true),
      body: BlocProvider(
        create: (context) => SigninCubit(),
        child: const SigninViewBody(),
      ),
    );
  }
}
