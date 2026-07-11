import 'package:flutter_task09_team_clean_architecture_app_beg/features/notifications/data/models/notifications_model.dart';

abstract class NotificationsState {}

class NotificationsLoading extends NotificationsState {}

class NotificationsLoaded extends NotificationsState {
  final List<NotificationModel> notifications;
  NotificationsLoaded(this.notifications);
}
