import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

@pragma('vm:entry-point')
class LocalNotificationService {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static StreamController<NotificationResponse> streamController =
      StreamController();
  static onTap(NotificationResponse notificationResponse) {
    streamController.add(notificationResponse);
  }

  static Future<void> init() async {
    InitializationSettings settings = InitializationSettings(
      android: AndroidInitializationSettings("@mipmap/ic_launcher"),
      iOS: DarwinInitializationSettings(),
    );
    flutterLocalNotificationsPlugin.initialize(
      settings,
      onDidReceiveBackgroundNotificationResponse: onTap,
      onDidReceiveNotificationResponse: onTap,
    );
  }

  static Future<void> showNotification(RemoteMessage message) async {
    NotificationDetails details = NotificationDetails(
      android: AndroidNotificationDetails(
        "id 0",
        "Mohammed Ashraf",
        channelDescription: "Main channel for app notifications",
        icon: "@mipmap/ic_launcher",
        importance: Importance.max,
        priority: Priority.high,
      ),
    );
    flutterLocalNotificationsPlugin.show(
      0,
      message.notification?.title,
      message.notification?.body,
      details,
      payload: "Mohammed Ashraf",
    );
  }
}
