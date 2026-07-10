import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/core/utils/assets.dart';

class NewArrivalStar extends StatelessWidget {
  final double top;
  final double? left;
  final double? right;
  final double size;

  const NewArrivalStar({
    super.key,
    required this.top,
    this.left,
    this.right,
    this.size = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top.h,
      left: left?.w,
      right: right?.w,
      child: SvgPicture.asset(
        AssetsData.markSvg,
        width: size.r,
        height: size.r,
      ),
    );
  }
}
