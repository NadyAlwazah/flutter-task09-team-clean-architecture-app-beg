import 'package:flutter/cupertino.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/core/utils/app_colors.dart';

class AppLoader extends StatelessWidget {
  final double radius;
  final Color? color;

  const AppLoader({super.key, this.radius = 15, this.color});

  @override
  Widget build(BuildContext context) {
    return CupertinoActivityIndicator(
      radius: radius,
      color: color ?? AppColors.primary,
    );
  }
}
