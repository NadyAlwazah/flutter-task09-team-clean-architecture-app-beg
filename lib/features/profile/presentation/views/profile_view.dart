import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/core/utils/app_colors.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/core/utils/assets.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/core/utils/styles.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/core/widgets/app_loader.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/core/widgets/custom_app_bar.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/features/profile/data/manager/user_cubit.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/features/profile/data/manager/user_state.dart';
import 'widgets/custom_profile_field.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key, required this.onBackToHome});
  final VoidCallback onBackToHome;

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<UserCubit>().getUserProfile();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        isAuth: true,
        title: "Profile",
        textStyle: Styles.textStyle20W600Raleway.copyWith(
          color: AppColors.appBarTitleColor,
        ),
        onTapLeading: () {
          widget.onBackToHome();
        },
      ),
      body: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          if (state is UserLoading) {
            return const Center(child: AppLoader());
          }

          if (state is UserSuccess) {
            _nameController.text = state.user.name;
            _emailController.text = state.user.email;
            _passController.text = state.user.password;

            return SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      const CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage(
                          'assets/images/image_21.png',
                        ),
                      ),
                      Positioned(
                        bottom: 4,
                        right: 4,
                        child: Container(
                          padding: const EdgeInsets.all(1),
                          decoration: const BoxDecoration(
                            color: AppColors.primary,
                            shape: BoxShape.circle,
                          ),
                          child: SvgPicture.asset(
                            AssetsData.penIconSvg,
                            width: 20,
                            height: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                  CustomProfileField(
                    label: "Your Name",
                    controller: _nameController,
                  ),
                  const SizedBox(height: 24),

                  CustomProfileField(
                    label: "Email Address",
                    controller: _emailController,
                  ),
                  const SizedBox(height: 24),

                  CustomProfileField(
                    label: "Password",
                    controller: _passController,
                    isPassword: true,
                  ),

                  const SizedBox(height: 5),
                  const Align(
                    alignment: Alignment.centerRight,

                    child: Padding(
                      padding: EdgeInsets.only(top: 8.0, bottom: 20),
                      child: Text(
                        "Recovery Password",
                        style: TextStyle(color: AppColors.textSecondary),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                      ),
                      onPressed: () {},
                      child: const Text(
                        "Save Now",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          return const Center(child: Text("Failed to load profile"));
        },
      ),
    );
  }
}
