import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../utils/tokens.dart';

class LocalNotificationService {

  static final FlutterLocalNotificationsPlugin
  _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  static void initialize() {
    final InitializationSettings initializationSettings =
    InitializationSettings(
        android: AndroidInitializationSettings("@mipmap/ic_launcher"));
    _flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  static void display(RemoteMessage message) async{
    try {
      print("In Notification method");
      // int id = DateTime.now().microsecondsSinceEpoch ~/1000000;
      Random random = new Random();
      int id = random.nextInt(1000);
      final NotificationDetails notificationDetails = NotificationDetails(
          android: AndroidNotificationDetails(
            "mychanel",
            "my chanel",
            importance: Importance.max,
            priority: Priority.high,
          )

      );
      print("my id is ${id.toString()}");
      await _flutterLocalNotificationsPlugin.show(

        id,
        message.notification!.title,
        message.notification!.title,
        notificationDetails,);
    } on Exception catch (e) {
      print('Error>>>$e');
    }
  }

  static void storeNotificationToken()async{
    String? token = await FirebaseMessaging.instance.getToken();
    FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).set(
        {
          'fcmToken': token
        },SetOptions(merge: true));
  }

  static void sendNotification(String? title, String? message, String? token)async{

    final data = {
      'click_action': 'FLUTTER_NOTIFICATION_CLICK',
      'id': '1',
      'status': 'done',
      'message': message,
    };

    try{
      http.Response response = await http.post(
        Uri.parse('https://fcm.googleapis.com/fcm/send'),
        headers: <String,String>{
        'Content-Type': 'application/json',
        'Authorization': "key=$serverKey"
      },
          body: jsonEncode(
            <String,dynamic>{
            'notification': <String,dynamic> {'title': title,'body': message},
            'priority': 'high',
            'data': data,
            'to': token
          })
      );


      if(response.statusCode == 200){
        print("Yeh notification is sent");
      }else{
        print(response.statusCode);
      }

    }catch(e){
      print('exception $e');
    }

  }
}