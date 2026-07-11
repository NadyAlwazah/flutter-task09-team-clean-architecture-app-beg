import 'package:flutter/material.dart';
import '../../../data/models/notifications_model.dart';
import 'notification_item.dart';

class NotificationList extends StatelessWidget {
  final List<NotificationModel> notifications;
  const NotificationList({super.key, required this.notifications});

  @override
  Widget build(BuildContext context) {
    final recent = notifications.where((n) => n.isRecent).toList();
    final yesterday = notifications.where((n) => !n.isRecent).toList();

    return ListView(
      padding: EdgeInsets.zero,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            "Recent",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        ...recent.asMap().entries.map(
          (entry) => NotificationItem(
            notification: entry.value,
            isFirst: entry.key == 0,
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            "Yesterday",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        ...yesterday.map(
          (n) => NotificationItem(notification: n, isFirst: false),
        ),
      ],
    );
  }
}
