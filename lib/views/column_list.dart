import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../profile/anonymous_profile_screen.dart';

class chatlist extends StatefulWidget {
  @override
  State<chatlist> createState() => _RelatedListState();
}

class CardItem {
  final String imageUrl;
  final String small;
  final String age;
  final String name;

  const CardItem({
    required this.imageUrl,
    required this.small,
    required this.age,
    required this.name,
  });
}

class _RelatedListState extends State<chatlist> {
  List<CardItem> items = [
    const CardItem(
        imageUrl: 'assets/images/Ellipse6.png',
        small: "I lost my emotional stability after I lost my father",
        age: "26 Yrs",
        name: "Priyanka Singh"),
    const CardItem(
        imageUrl: 'assets/images/Ellipse6 (2).png',
        small: "Felt broken after boyfriend cheated with me",
        age: "25 Yrs",
        name: "Alisha Jain"),
    const CardItem(
        imageUrl: 'assets/images/Ellipse6 (3).png',
        small: "Faced failure in my career due to my relationship",
        age: "21 Yrs",
        name: "Ayushi Nagar"),
    const CardItem(
        imageUrl: 'assets/images/Ellipse6 (4).png',
        small: "I was emotionally unstable for 6 years after breakup",
        age: "33 Yrs",
        name: "Rahul Mishra"),
    const CardItem(
        imageUrl: 'assets/images/Ellipse6 (5).png',
        small: "I faced domestic violence and fractured my bone",
        age: "20 Yrs",
        name: "Vidit Singhal"),
    const CardItem(
        imageUrl: 'assets/images/Ellipse8.png',
        small: "I got fat shamed because of my weight",
        age: "22 Yrs",
        name: "Mayank Yadav"),
  ];

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => Container(
        height: 477.0, //seen dekhna padega,tobe changed accordingly
        width: 360,
        child: SizedBox(
          height: 75.0,
          child: ListView.separated(
            scrollDirection: Axis.vertical,
            itemCount: 6,
            separatorBuilder: (context, _) => const SizedBox(height: 10),
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                if(items[index] == 0) {
                  Get.to(() => AnonymousProfileScreen());
                }
              },
              child: buildCard(items[index])
            ),
          ),
        ),
      ),
      designSize: const Size(360, 477),
    );
  }

  Widget buildCard(CardItem item) => Container(
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
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(item.imageUrl),
                            fit: BoxFit.fitWidth),
                        borderRadius:
                        BorderRadius.all(Radius.elliptical(75, 75)),
                      ))),
              Positioned(
                  top: 1,
                  left: 102,
                  child: Text(
                    item.name,
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
                      item.small,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Color.fromRGBO(127, 127, 127, 1),
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
                    item.age,
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
  );
}
