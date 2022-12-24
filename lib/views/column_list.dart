import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:untvoice/models/anonymous_user_model.dart';

import '../controller/data_controller.dart';

import '../profile/anonymous_profile_screen.dart';

class chatlist extends StatefulWidget {
  @override
  State<chatlist> createState() => _RelatedListState();
}

// class CardItem {
//   final String imageUrl;
//   final String small;
//   final String age;
//   final String name;
//
//   const CardItem({
//     required this.imageUrl,
//     required this.small,
//     required this.age,
//     required this.name,
//   });
// }

class _RelatedListState extends State<chatlist> {
//   List<Counsellor> items = [
// const CardItem(imageUrl: imageUrl)
//   ];
  final DataController controller = Get.find();

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      await controller.getLoginUserProduct();
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (controller, child) => Container(
        height: 477.0, //seen dekhna padega,tobe changed accordingly
        width: 360,

        child: SizedBox(
          height: 75.0,
          child: GetBuilder<DataController>(
            builder: (controller) => controller.counsellorData.isEmpty
                ? Center(
                    child: Text('😔 NO DATA FOUND PLEASE ADD DATA 😔'),
                  )
                : ListView.separated(
                    scrollDirection: Axis.vertical,
                    itemCount: controller.counsellorData.length,
                    separatorBuilder: (context, _) =>
                        const SizedBox(height: 10),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Get.to(() => AnonymousProfileScreen(), arguments: {
                            'first': controller.counsellorData[index].firstname,
                            'rate': controller.counsellorData[index].charges,
                            'age': controller.counsellorData[index].age,
                            'longDetails': controller.counsellorData[index].longDetails,
                            'imageUrl': controller.counsellorData[index].image,
                            'uid': controller.counsellorData[index].uid,
                            'fcmToken': controller.counsellorData[index].fcmToken,
                          });
                        },
                        child: Container(
                          height: 75.0,
                          decoration: BoxDecoration(),
                          child: Row(
                            children: [
                              Container(
                                width: 356,
                                height: 75,
                                child: Stack(
                                  children: <Widget>[
                                    Positioned(
                                        top: 0,
                                        left: 10,
                                        child: Container(
                                            width: 75,
                                            height: 75,
                                            child: Image.network(controller
                                                .counsellorData[index].image),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.elliptical(75, 75)),
                                            ))),
                                    Positioned(
                                        top: 1,
                                        left: 102,
                                        child: Text(
                                          controller
                                              .counsellorData[index].firstname,
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color: Color.fromRGBO(0, 0, 0, 1),
                                              fontFamily: 'Outfit',
                                              fontSize: 20,
                                              letterSpacing:
                                                  0 /*percentages not used in flutter. defaulting to zero*/,
                                              fontWeight: FontWeight.bold,
                                              height: 1),
                                        )),
                                    Positioned(
                                        top: 30,
                                        left: 104,
                                        child: Container(
                                          width: 198,
                                          height: 33,
                                          child: Text(
                                            controller.counsellorData[index]
                                                .shortDetails,
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    127, 127, 127, 1),
                                                fontFamily: 'Outfit',
                                                fontSize: 16,
                                                letterSpacing: 0,
                                                fontWeight: FontWeight.normal,
                                                height: 1),
                                          ),
                                        )),
                                    Positioned(
                                        top: 3,
                                        left: 300,
                                        child: Text(
                                          '${controller.counsellorData[index].age} Yrs',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color: Color.fromRGBO(0, 0, 0, 1),
                                              fontFamily: 'Outfit',
                                              fontSize: 16,
                                              letterSpacing: 0,
                                              fontWeight: FontWeight.normal,
                                              height: 1),
                                        )),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ),
      ),
      designSize: const Size(360, 477),
    );
  }

// Widget buildCard(Counsellor item) => Container(
//       height: 75.0,
//       decoration: BoxDecoration(),
//       child: Row(
//         children: [
//           Container(
//             width: 356,
//             height: 75,
//             child: Stack(
//               children: <Widget>[
//                 Positioned(
//                     top: 0,
//                     left: 10,
//                     child: Container(
//                         width: 75,
//                         height: 75,
//                         decoration: BoxDecoration(
//                           image: DecorationImage(
//                               image: Image.network(
//
//                               ),
//
//
//                               fit: BoxFit.fitWidth),
//                           borderRadius:
//                               BorderRadius.all(Radius.elliptical(75, 75)),
//                         ))),
//                 Positioned(
//                     top: 1,
//                     left: 102,
//                     child: Text(
//                       item.,
//                       textAlign: TextAlign.left,
//                       style: TextStyle(
//                           color: Color.fromRGBO(0, 0, 0, 1),
//                           fontFamily: 'Outfit',
//                           fontSize: 20,
//                           letterSpacing:
//                               0 /*percentages not used in flutter. defaulting to zero*/,
//                           fontWeight: FontWeight.bold,
//                           height: 1),
//                     )),
//                 Positioned(
//                     top: 30,
//                     left: 104,
//                     child: Container(
//                       width: 198,
//                       height: 33,
//                       child: Text(
//                         contr
//                         textAlign: TextAlign.left,
//                         style: TextStyle(
//                             color: Color.fromRGBO(127, 127, 127, 1),
//                             fontFamily: 'Outfit',
//                             fontSize: 16,
//                             letterSpacing: 0,
//                             fontWeight: FontWeight.normal,
//                             height: 1),
//                       ),
//                     )),
//                 Positioned(
//                     top: 3,
//                     left: 300,
//                     child: Text(
//                       item.age,
//                       textAlign: TextAlign.left,
//                       style: TextStyle(
//                           color: Color.fromRGBO(0, 0, 0, 1),
//                           fontFamily: 'Outfit',
//                           fontSize: 16,
//                           letterSpacing: 0,
//                           fontWeight: FontWeight.normal,
//                           height: 1),
//                     )),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
}
