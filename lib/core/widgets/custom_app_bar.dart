import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/core/utils/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final TextStyle? textStyle;
  final Widget? action;
  final VoidCallback? onTapAction;
  final VoidCallback? onTapLeading;
  final bool isActionIcon;
  final bool isLeadingSvg;
  final Widget? leadingSvg;
  const CustomAppBar({
    super.key,
    this.title,
    this.textStyle,
    this.action,
    this.onTapAction,
    this.isActionIcon = true,
    this.isLeadingSvg = false,
    this.onTapLeading,
    this.leadingSvg,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.backgroundColorItem,
      elevation: 0,

      // leading
      leading: isLeadingSvg
          ? leadingSvg
          : Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: CircleAvatar(
                backgroundColor: AppColors.backgroundColor,

                child: GestureDetector(
                  onTap: onTapLeading,
                  child: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: AppColors.appBarTitleColor,
                    size: 15.r,
                  ),
                ),
              ),
            ),
      centerTitle: true,

      //title
      title: Text(title ?? '', style: textStyle),

      //actions
      actions: [
        if (action != null)
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: GestureDetector(
              onTap: onTapAction,
              child: isActionIcon
                  ? Container(
                      padding: const EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40.r),
                        color: const Color(0xFFF7F7F9),
                      ),
                      child: action,
                    )
                  : action,
            ),
          ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
