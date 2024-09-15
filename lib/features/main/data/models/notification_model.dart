import 'package:real_state/features/main/domain/entities/notification_entity.dart';

class NotificationModel extends Notification {
  const NotificationModel({
    required super.title,
    required super.body,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      title: json['Notification']['title'],
      body: json['Notification']['body'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'body': body,
    };
  }
}
