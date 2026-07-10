import 'package:flutter/material.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/core/utils/validators.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/features/auth/presentation/views/widgets/custom_text_form_field.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/features/auth/presentation/views/widgets/form_label.dart';

class SigninFormFields extends StatelessWidget {
  const SigninFormFields({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const FormLabel(text: "Email Address"),
        const SizedBox(height: 12),

        CustomTextFormField(
          controller: emailController,
          hintText: "xyz@gmail.com",
          textInputType: TextInputType.emailAddress,
          validator: Validators.validateEmail,
        ),

        const SizedBox(height: 30),

        const FormLabel(text: "Password"),
        const SizedBox(height: 12),

        CustomTextFormField(
          controller: passwordController,
          hintText: "●●●●●●●●",
          textInputType: TextInputType.text,
          obscureText: true,
          validator: Validators.validatePassword,
        ),
      ],
    );
  }
}
