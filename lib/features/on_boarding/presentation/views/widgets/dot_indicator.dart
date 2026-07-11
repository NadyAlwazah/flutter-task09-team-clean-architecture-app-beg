import 'package:flutter/material.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/core/utils/app_colors.dart';

class DotIndicator extends StatelessWidget {
  final int currentIndex;
  final int pageIndex;

  const DotIndicator({
    super.key,
    required this.currentIndex,
    required this.pageIndex,
  });

  @override
  Widget build(BuildContext context) {
    final bool isActive = currentIndex == pageIndex;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 6,
      width: isActive ? 35 : 12,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : AppColors.primary.withOpacity(0.35),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
