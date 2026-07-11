import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/core/utils/app_colors.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/core/utils/assets.dart';

class CustomBottomNavBar extends StatelessWidget {
  final Function(int) onTap;
  final int currentIndex;

  const CustomBottomNavBar({
    super.key,
    required this.onTap,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 106,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          CustomPaint(
            size: Size(MediaQuery.of(context).size.width, 106),
            painter: BottomNavPainter(),
          ),

          // الأيقونات
          Positioned.fill(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _navItem(index: 0, asset: AssetsData.homeIconSvg),
                _navItem(index: 1, asset: AssetsData.iconFavoriteSvg),

                SizedBox(width: 60.w),

                _navItem(index: 3, asset: AssetsData.notificationIconSvg),
                _navItem(index: 4, asset: AssetsData.personIconSvg),
              ],
            ),
          ),

          // الزر الأوسط
          Positioned(
            top: 0,
            left: MediaQuery.of(context).size.width / 2 - 26,
            child: GestureDetector(
              onTap: () => onTap(2),
              child: CircleAvatar(
                radius: 27.r,
                backgroundColor: AppColors.primary,
                child: SvgPicture.asset(
                  AssetsData.iconBagSvg,
                  width: 24.r,
                  height: 24.r,
                  color: AppColors.backgroundColorItem,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _navItem({required int index, required String asset}) {
    final isSelected = index == currentIndex;

    return GestureDetector(
      onTap: () => onTap(index),
      child: SvgPicture.asset(
        asset,
        width: 24.r,
        height: 24.r,
        color: isSelected ? AppColors.primary : AppColors.textSubTitle,
      ),
    );
  }
}

class BottomNavPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.backgroundColorItem
      ..style = PaintingStyle.fill;

    final path = Path();

    path.moveTo(0, 0);

    // الجهة اليسرى
    path.quadraticBezierTo(size.width * 0.10, 25, size.width * 0.35, 20);
    path.quadraticBezierTo(size.width * 0.39, 18, size.width * 0.40, 40);

    path.arcToPoint(
      Offset(size.width * 0.60, 39),
      radius: const Radius.circular(40),
      clockwise: false,
    );

    // الجهة اليمنى
    path.quadraticBezierTo(size.width * 0.61, 18, size.width * 0.65, 20);
    path.quadraticBezierTo(size.width * 0.90, 25, size.width, 0);

    // إغلاق الشكل
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawShadow(path, Colors.black26, 6, false);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
