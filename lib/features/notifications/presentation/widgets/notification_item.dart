import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/core/utils/app_colors.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/core/utils/assets.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/core/utils/styles.dart';
import '../../data/models/notifications_model.dart';

class NotificationItem extends StatelessWidget {
  final NotificationModel notification;
  final bool isFirst;

  const NotificationItem({
    super.key,
    required this.notification,
    this.isFirst = false,
  });

  String getImagePath() {
    if (notification.id == '1') return AssetsData.tShirt1;
    if (notification.id == '2' || notification.id == '3') {
      return AssetsData.tShirt2;
    }
    return AssetsData.tShirt3;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: isFirst ? Colors.white : Colors.transparent,
        borderRadius: BorderRadius.circular(16.r),
        border: isFirst ? Border.all(color: Colors.white, width: 2) : null,
        boxShadow: isFirst
            ? [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ]
            : [],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 75.w,
            height: 75.w,
            decoration: BoxDecoration(
              color: AppColors.backgroundColorItem,
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(
                color: isFirst ? Colors.grey.shade200 : Colors.white,
                width: 1.5,
              ),
            ),
            padding: EdgeInsets.all(8.w),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: Image.asset(getImagePath(), fit: BoxFit.cover),
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    notification.time,
                    style: Styles.textStyle14W500Poppins.copyWith(
                      fontSize: 14.sp,
                      color: Colors.grey,
                    ),
                  ),
                ),
                Text(
                  notification.title,
                  style: Styles.textStyle14W500Raleway.copyWith(
                    fontSize: 16.sp,
                  ),
                ),
                SizedBox(height: 4.h),
                if (notification.message.isNotEmpty)
                  Text(
                    notification.message,
                    style: Styles.textStyle11W500Poppins.copyWith(
                      fontSize: 12.sp,
                      color: Colors.grey,
                    ),
                  ),
                if (notification.newPrice != null)
                  Padding(
                    padding: EdgeInsets.only(top: 8.h),
                    child: Row(
                      children: [
                        Text(
                          '\$${notification.oldPrice}',
                          style: Styles.textStyle11W500Poppins.copyWith(
                            fontSize: 14.sp,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Text(
                          '\$${notification.newPrice}',
                          style: Styles.textStyle14W500Poppins.copyWith(
                            fontSize: 15.sp,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
