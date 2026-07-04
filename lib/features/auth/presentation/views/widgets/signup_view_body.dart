import 'package:flutter/material.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/core/widgets/custom_button.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/features/auth/presentation/views/widgets/auth_header.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/features/auth/presentation/views/widgets/custom_button_with_google.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/features/auth/presentation/views/widgets/signup_form_fields.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    fullNameController.dispose();
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
              const AuthHeader(title: "Register Account"),
              const SizedBox(height: 30),

              SignupFormFields(
                fullNameController: fullNameController,
                emailController: emailController,
                passwordController: passwordController,
              ),

              const SizedBox(height: 40),
              CustomButton(
                text: "Sign up",
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {}
                },
              ),

              const SizedBox(height: 24),
              CustomButtonWithGoogle(
                text: "Sign up with Google",
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
