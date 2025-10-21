import 'dart:developer';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:push_notifications/services/local_notification_service.dart';

@pragma('vm:entry-point')
class PushNotificationsServices {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static Future init() async {
    await messaging.requestPermission();
    String? token = await messaging.getToken();
    log(token ?? "No Token");
    FirebaseMessaging.onBackgroundMessage(handlBackgroundMessage);
    handelForegroundMessaging();
  }

  static Future<void> handlBackgroundMessage(
    RemoteMessage remoteMessage,
  ) async {
    Firebase.initializeApp();
  }

  // Foreground Notification message
  static void handelForegroundMessaging() {
    FirebaseMessaging.onMessage.listen(((RemoteMessage message) {
      LocalNotificationService.showNotification(message);
    }));
  }
}
