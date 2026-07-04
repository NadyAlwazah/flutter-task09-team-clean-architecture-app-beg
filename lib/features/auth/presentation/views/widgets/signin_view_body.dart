import 'package:flutter/material.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/core/widgets/custom_button.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/features/auth/presentation/views/widgets/auth_header.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/features/auth/presentation/views/widgets/custom_button_with_google.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/features/auth/presentation/views/widgets/donot_have_an_account_widget.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/features/auth/presentation/views/widgets/recovery_password_text.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/features/auth/presentation/views/widgets/signin_form_fields.dart';

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
            children: [
              const AuthHeader(
                title: "Hello Again!",
                subtitlePartOne: "Fill your details or continue with",
                subtitlePartTwo: "social media",
              ),
              const SizedBox(height: 30),

              SigninFormFields(
                emailController: emailController,
                passwordController: passwordController,
              ),

              const SizedBox(height: 12),
              const RecoveryPasswordText(),

              const SizedBox(height: 24),
              CustomButton(
                text: "Sign In",
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {}
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
