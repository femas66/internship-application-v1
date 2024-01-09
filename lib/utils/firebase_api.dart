import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get_storage/get_storage.dart';

void handleBackgroundNotification(details) {
  final payload = details.payload;
  if (payload != null) {
    final message = RemoteMessage.fromMap(jsonDecode(payload));
    print("MESSAGE : $message");
  }
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Title: ${message.notification?.title}");
  print("Title: ${message.notification?.body}");
  print("Title: ${message.data}");
}

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;

  final _androidChannel = const AndroidNotificationChannel(
      "high_importance_channel", "High Importance Notifications",
      description: "This channel is used for important notifications",
      importance: Importance.high);

  final _localNotificationsPlugin = FlutterLocalNotificationsPlugin();

  Future<void> _handleNotifications(RemoteMessage message) async {
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;
    if (notification != null && android != null) {
      _localNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            _androidChannel.id,
            _androidChannel.name,
            channelDescription: _androidChannel.description,
            icon: android.smallIcon,
            importance: _androidChannel.importance,
            priority: Priority.high,
            enableLights: true,
            enableVibration: true,
            playSound: true,
            showWhen: true,
          ),
        ),
        payload: jsonEncode(message.toMap()),
      );
    }
  }

  void handleMessage(RemoteMessage message) async {
    print("AKSINYA");
  }

  Future initPushNotifications() async {
    await _firebaseMessaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) {
      handleMessage(initialMessage);
    }

    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    FirebaseMessaging.onMessage.listen(_handleNotifications);
  }

  Future<void> initNotifications() async {
    GetStorage box = GetStorage();

    await _firebaseMessaging.requestPermission();

    final token = await _firebaseMessaging.getToken();
    box.write('deviceToken', token);
    print('FirebaseMessaging token: $token');

    initPushNotifications();
    initLocalNotifications();
    // handle background message
    // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  Future initLocalNotifications() async {
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    const settings = InitializationSettings(android: android);

    await _localNotificationsPlugin.initialize(
      settings,
      onDidReceiveNotificationResponse: handleBackgroundNotification,
      onDidReceiveBackgroundNotificationResponse: handleBackgroundNotification,
    );

    final platform =
        _localNotificationsPlugin.resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>();
    await platform?.createNotificationChannel(_androidChannel);
  }
}
