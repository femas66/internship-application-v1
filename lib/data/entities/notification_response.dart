import 'package:json_annotation/json_annotation.dart';
import 'package:pkl_apps/data/notification.dart';

part 'notification_response.g.dart';

@JsonSerializable()
class NotificationResponse {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "title")
  final String title;
  @JsonKey(name: "message")
  final String message;
  @JsonKey(name: "read_at")
  String? readAt;
  @JsonKey(name: 'created_at')
  final String createdAt;

  NotificationResponse({
    required this.id,
    required this.title,
    required this.message,
    this.readAt,
    required this.createdAt,
  });

  factory NotificationResponse.fromJson(Map<String, dynamic> json) =>
      _$NotificationResponseFromJson(json);

  Notification toNotification() => Notification(
        id: id,
        title: title,
        message: message,
        createdAt: createdAt,
        readAt: readAt,
      );
}
