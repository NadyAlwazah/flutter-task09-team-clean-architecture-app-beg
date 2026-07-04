import 'package:flutter/material.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/core/utils/styles.dart';

class RecoveryPasswordText extends StatelessWidget {
  final VoidCallback? onTap;

  const RecoveryPasswordText({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: InkWell(
        onTap: onTap,
        child: Text("Recovery Password", style: Styles.textStyle12W400Poppins),
      ),
    );
  }
}
