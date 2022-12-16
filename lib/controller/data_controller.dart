import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untvoice/controller/comman_dailog.dart';
class DataController extends GetxController {

  final firebaseInstance = FirebaseFirestore.instance;
  Map dataNotifier ={'first': '', 'last': ''};
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> getUserProfileData() async {
    // print("user id ${authController.userId}");
    try {
      CommonDialog.showLoading();
      var response = await firebaseInstance
          .collection('users')
          .where('uid', isEqualTo: auth.currentUser!.uid)
          .get();
      // response.docs.forEach((result) {
      //   print(result.data());
      // });
      if (response.docs.isNotEmpty) {
        final newData = dataNotifier;
        newData['first'] = response.docs[0]['first'];
        newData['last'] = response.docs[0]['last'];
        newData['gender'] = response.docs[0]['gender'];
        newData['dob'] = response.docs[0]['dob'];
        newData['imageUrl'] = response.docs[0]['image'];
        dataNotifier = newData;


      }
      debugPrint(dataNotifier.toString());
      CommonDialog.hideLoading();
    } on FirebaseException catch (e) {
      CommonDialog.hideLoading();
      CommonDialog.showErrorDialog();
      print(e);
    } catch (error) {
      CommonDialog.hideLoading();
      CommonDialog.showErrorDialog();
      print(error);
    }

  }// @override
//   void update([List<Object>? ids, bool condition = true]) {
//     // TODO: implement update
//     super.update(ids, condition);
//   }

}