import 'package:flutter/material.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/core/utils/styles.dart';

class AuthHeader extends StatelessWidget {
  final String title;
  final String subtitlePartOne;
  final String subtitlePartTwo;

  const AuthHeader({
    super.key,
    required this.title,
    required this.subtitlePartOne,
    required this.subtitlePartTwo,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(title, style: Styles.textStyle32Bold),
          const SizedBox(height: 8),
          Text(subtitlePartOne, style: Styles.textStyle16W400Poppins),
          Text(subtitlePartTwo, style: Styles.textStyle16W400Poppins),
        ],
      ),
    );
  }
}
