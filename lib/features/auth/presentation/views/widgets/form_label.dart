import 'package:flutter/material.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/core/utils/styles.dart';

class FormLabel extends StatelessWidget {
  final String text;

  const FormLabel({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: Styles.textStyle16W500Raleway);
  }
}
