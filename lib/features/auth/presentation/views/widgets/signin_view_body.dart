import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/core/app/routes.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/core/widgets/custom_button.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/core/widgets/custom_snack_bar.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/features/auth/data/manager/signin_cubit/signin_cubit.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/features/auth/presentation/views/widgets/auth_header.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/features/auth/presentation/views/widgets/custom_button_with_google.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/features/auth/presentation/views/widgets/donot_have_an_account_widget.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/features/auth/presentation/views/widgets/recovery_password_text.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/features/auth/presentation/views/widgets/signin_form_fields.dart';
import 'package:go_router/go_router.dart';

class SigninViewBody extends StatefulWidget {
  const SigninViewBody({super.key});

  @override
  State<SigninViewBody> createState() => _SigninViewBodyState();
}

class _SigninViewBodyState extends State<SigninViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const AuthHeader(title: "Hello Again!"),
              const SizedBox(height: 30),

              SigninFormFields(
                emailController: emailController,
                passwordController: passwordController,
              ),

              const SizedBox(height: 12),
              const RecoveryPasswordText(),

              const SizedBox(height: 24),
              BlocConsumer<SigninCubit, SigninState>(
                listener: (context, state) {
                  if (state is SigninSuccess) {
                    context.go(AppRouter.kBottomBar);
                  } else if (state is SigninError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      CustomSnackBar(message: state.message, isError: true),
                    );
                  }
                },
                buildWhen: (previous, current) =>
                    current is SigninLoading ||
                    current is SigninError ||
                    current is SigninSuccess,
                builder: (context, state) {
                  if (state is SigninLoading) {
                    return const CustomButton(isLoading: true);
                  }
                  return CustomButton(
                    text: "Sign In",
                    onPressed: () async {
                      context.read<SigninCubit>().login(
                        username: "emilys",
                        password: "emilyspass",
                      );
                      // if (_formKey.currentState!.validate()) {
                      //   context.read<SigninCubit>().login(
                      //     username: emailController.text,
                      //     password: passwordController.text,
                      //   );
                      // }
                    },
                  );
                },
              ),

              const SizedBox(height: 24),
              CustomButtonWithGoogle(
                text: "Sign In with Google",
                onPressed: () {},
              ),

              const SizedBox(height: 135),
              const DonotHaveAnAccountWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
