import 'package:flutter/material.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/core/utils/styles.dart';

class CustomProfileField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool isPassword;

  const CustomProfileField({
    super.key,
    required this.label,
    required this.controller,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Styles.textStyle16W600Raleway.copyWith(color: Colors.grey),
        ),
        const SizedBox(height: 12),
        TextField(
          controller: controller,
          readOnly: true,
          obscureText: isPassword,
          obscuringCharacter: '●',
          style: Styles.textStyle14W500Poppins.copyWith(
            color: isPassword ? Colors.grey : Colors.black,
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[100],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
          ),
        ),
      ],
    );
  }
}
