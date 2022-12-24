import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untvoice/controller/comman_dailog.dart';
import 'package:untvoice/models/anonymous_user_model.dart';

class DataController extends GetxController {
  final firebaseInstance = FirebaseFirestore.instance;
  Map dataNotifier = {'first': '', 'last': ''};
  List<Counsellor> counsellorData = [];
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
  } // @override

//   void update([List<Object>? ids, bool condition = true]) {
//     // TODO: implement update
//     super.update(ids, condition);
//   }
  Future<void> getLoginUserProduct() async {
    print("counsellorData YEs $counsellorData");
    counsellorData = [];
    try {
      CommonDialog.showLoading();
      final List<Counsellor> loadedCounsellors = [];
      var response = await firebaseInstance
          .collection('counsellor_anonymous')
          .where('work', isEqualTo: 'Counsellor')
          .get();

      if (response.docs.isNotEmpty) {
        for (var result in response.docs) {
          print(result.data());
          print("Counsellor ID  ${result.id}");
          loadedCounsellors.add(Counsellor(
            charges: result['charges'],
            dob: result['dob'],
            age: result['age'],
            firstname: result['first'],
            gender: result['gender'],
            image: result['image'],
            longDetails: result['longDetails'],
            mobileNumber: result['mobileNumber'],
            shortDetails: result['shortDetails'],
            uid: result.id,
            work: result['work'],
            fcmToken: result['fcmToken'],
          ));
        }
      }
      counsellorData.addAll(loadedCounsellors);
      update();
      CommonDialog.hideLoading();
    } on FirebaseException catch (e) {
      CommonDialog.hideLoading();
      CommonDialog.showErrorDialog();
      print("Error $e");
    } catch (error) {
      CommonDialog.hideLoading();
      CommonDialog.showErrorDialog();
      print("error $error");
    }
  }
}
