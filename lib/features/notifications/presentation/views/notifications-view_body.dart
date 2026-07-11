import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/core/utils/app_colors.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/core/utils/assets.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/core/utils/styles.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/features/notifications/managers/notifications_cubit.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/features/notifications/managers/notifications_state.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/features/notifications/presentation/widgets/notification_list.dart';

class NotificationsBody extends StatelessWidget {
  const NotificationsBody({super.key, required this.onBackToHome});
  final VoidCallback onBackToHome;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.all(8.w),
          child: Container(
            decoration: const BoxDecoration(
              color: AppColors.backgroundColorItem,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: AppColors.onboardBackgroundColor,
                size: 16,
              ),
              onPressed: () => onBackToHome(),
            ),
          ),
        ),
        title: Text('Notifications', style: Styles.textStyle16W600Raleway),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: GestureDetector(
              onTap: () {
                context.read<NotificationsCubit>().clearAllNotifications();
              },
              child: Container(
                padding: EdgeInsets.all(10.w),
                decoration: const BoxDecoration(
                  color: AppColors.backgroundColorItem,
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(
                  AssetsData.deleteIconSvg,
                  color: AppColors.onboardBackgroundColor,
                  width: 22.w,
                  height: 22.w,
                ),
              ),
            ),
          ),
        ],
      ),
      body: BlocBuilder<NotificationsCubit, NotificationsState>(
        builder: (context, state) {
          if (state is NotificationsLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is NotificationsLoaded) {
            if (state.notifications.isEmpty) {
              return Center(
                child: Text(
                  "No notifications",
                  style: Styles.textStyle16W600Raleway,
                ),
              );
            }
            return NotificationList(notifications: state.notifications);
          }
          return const Center(child: Text("No notifications"));
        },
      ),
    );
  }
}
