import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untvoice/services/local_notification_services.dart';
import 'package:untvoice/views/home_screen.dart';
import 'package:untvoice/views/onboarding_screen.dart';

Future<void> _firebaseMesagingBackgroundHandler(RemoteMessage message) async {
  print(message.data.toString());
  print(message.notification.toString());
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  LocalNotificationService.initialize();
  FirebaseMessaging.onBackgroundMessage(_firebaseMesagingBackgroundHandler);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: GoogleFonts.latoTextTheme(
            Theme.of(context).textTheme,
        ),
      ),
      // home: OnBoardingScreen()
      home: FirebaseAuth.instance.currentUser!.uid == null? OnBoardingScreen() : HomeScreen(),
    );
  }
}