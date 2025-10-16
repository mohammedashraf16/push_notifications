import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:push_notifications/app/app.dart';
import 'package:push_notifications/firebase_options.dart';
import 'package:push_notifications/services/push_notifications_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  PushNotificationsServices.init();
  runApp(const PushNotifications());
}
