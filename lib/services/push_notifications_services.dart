import 'dart:developer';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';

class PushNotificationsServices {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static Future init() async {
    await messaging.requestPermission();
    String? token = await messaging.getToken();
    log(token ?? "No Token");
    FirebaseMessaging.onBackgroundMessage(handlBackgroundMessage);
  }

  static Future<void> handlBackgroundMessage(
    RemoteMessage remoteMessage,
  ) async {
    Firebase.initializeApp();
    log(remoteMessage.notification?.title ?? "No Title");
  }
}
