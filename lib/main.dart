import 'package:flutter/material.dart';
import 'package:sakib/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sakib/firebase/firebase_notification.dart';
import 'package:sakib/firebase/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseNotificationService.instance.initialize();
  runApp(const MyApp());
}
