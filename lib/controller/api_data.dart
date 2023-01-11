
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart';

void getData(String channel, String uid) async {
  String? current_uid = FirebaseAuth.instance.currentUser?.uid.toString();
  Response response = await get(Uri.parse("https://untangled.onrender.com/rtc/$channel/audience/$uid"));
  Map data = jsonDecode(response.body);
  FirebaseFirestore.instance.collection('users')
      .doc(current_uid)
      .set({
    'rtcToken': data["rtcToken"]
  },SetOptions(merge: true)).then((value){
    //Do your stuff.
  });
}