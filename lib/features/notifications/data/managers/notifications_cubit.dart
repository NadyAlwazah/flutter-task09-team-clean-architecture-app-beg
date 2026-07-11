import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/features/notifications/data/models/notifications_model.dart';
import 'notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  NotificationsCubit() : super(NotificationsLoading());

  void fetchNotifications() {
    final List<NotificationModel> list = [
      NotificationModel(
        id: '1',
        title: 'Thanks you for\n purchasing',
        message: 'Your order will be shipped\n in 2-4 days',
        time: '7 min ago',
        isRecent: true,
      ),
      NotificationModel(
        id: '2',
        title: 'We Have New\n Products With Offers',
        message: '',
        time: '40 min ago',
        oldPrice: 364.95,
        newPrice: 260.00,
        isRecent: true,
      ),
      NotificationModel(
        id: '3',
        title: 'We Have New\n Products With Offers',
        message: '',
        time: '40 min ago',
        oldPrice: 364.95,
        newPrice: 260.00,
        isRecent: false,
      ),
      NotificationModel(
        id: '4',
        title: 'We Have New\n Products With Offers',
        message: '',
        time: '40 min ago',
        oldPrice: 364.95,
        newPrice: 260.00,
        isRecent: false,
      ),
    ];
    emit(NotificationsLoaded(list));
  }

  void deleteNotification(String id) {
    final currentState = state;
    if (currentState is NotificationsLoaded) {
      final updatedList = currentState.notifications
          .where((n) => n.id != id)
          .toList();
      emit(NotificationsLoaded(updatedList));
    }
  }

  void clearAllNotifications() {
    emit(NotificationsLoaded([]));
  }
}
