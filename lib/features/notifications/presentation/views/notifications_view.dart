//
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/features/notifications/data/managers/notifications_cubit.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/features/notifications/presentation/views/widgets/notifications-view_body.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key, required this.onBackToHome});
  final VoidCallback onBackToHome;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotificationsCubit()..fetchNotifications(),
      child: NotificationsBody(onBackToHome: onBackToHome),
    );
  }
}
