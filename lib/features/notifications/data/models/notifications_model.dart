class NotificationModel {
  final String id;
  final String title;
  final String message;
  final String time;
  final String? imageUrl;
  final double? oldPrice;
  final double? newPrice;
  final bool isRecent;

  NotificationModel({
    required this.id,
    required this.title,
    required this.message,
    required this.time,
    this.imageUrl,
    this.oldPrice,
    this.newPrice,
    required this.isRecent,
  });
}
