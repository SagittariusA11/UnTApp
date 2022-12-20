import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AnonymousProfileScreen extends StatefulWidget {
  const AnonymousProfileScreen({Key? key}) : super(key: key);

  @override
  State<AnonymousProfileScreen> createState() => _AnonymousProfileScreenState();
}

class _AnonymousProfileScreenState extends State<AnonymousProfileScreen> {
  Map dataOfcounsellor = {'first': '', 'age': '','longDetails':'','rate':'','imageUrl':''};
  @override
  Widget build(BuildContext context) {
    var data = Get.arguments;
    final newDataOfCousellor = dataOfcounsellor;
    newDataOfCousellor['first'] = data['first'];
    newDataOfCousellor['age'] = data['age'];
    newDataOfCousellor['longDetails'] = data['longDetails'];
    newDataOfCousellor['rate'] = data['rate'];
    newDataOfCousellor['imageUrl'] = data['imageUrl'];
    dataOfcounsellor = newDataOfCousellor;
    debugPrint(dataOfcounsellor.toString());


    return ScreenUtilInit(
        builder: (context, child) => SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Color.fromARGB(255, 240, 240, 240),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.35,
                  child: Stack(
                    children: [
                      Image.asset('assets/anonymous_profile_screen/background.png'),
                      Positioned(
                          left: MediaQuery.of(context).size.width/2 - 55,
                          top: MediaQuery.of(context).size.width/2 - 55,
                          child: Column(
                            children: [
                              Container(
                                  height: 80,
                                  width: 80,
                                  child: Image.network(dataOfcounsellor['imageUrl'])
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              myText(dataOfcounsellor['first'], 15, FontWeight.w900),
                              myText('${dataOfcounsellor['age']} Yrs', 13, FontWeight.w800),
                            ],
                          )
                      )
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height*0.29,
                  width: MediaQuery.of(context).size.width*.8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.white.withOpacity(0.60),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(20, 40, 0, 0),
                          ),
                          myText('Aboute Me', 17, FontWeight.w900),
                        ],
                      ),
                      Container(
                          padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                          child: myText(dataOfcounsellor['longDetails'], 15, FontWeight.w400)
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height*0.13,
                        width: MediaQuery.of(context).size.width*.37,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.white.withOpacity(0.60),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            myText('Ratings', 17, FontWeight.w900),
                            Container(
                              padding: EdgeInsets.only(top: 5, bottom: 5),
                              height: 40,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset('assets/anonymous_profile_screen/star.png'),
                                  Container(
                                    width: 7,
                                  ),
                                  myText('4.6', 28, FontWeight.w900),
                                ],
                              ),
                            ),
                            myText('100+ Reviews', 17, FontWeight.w400),
                            Container(height: 5)
                          ],
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height*0.13,
                        width: MediaQuery.of(context).size.width*.37,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.white.withOpacity(0.60),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            myText('Charges', 17, FontWeight.w900),
                            Container(
                              padding: EdgeInsets.only(top: 5, bottom: 5),
                              height: 40,
                              child: myText('₹ ${dataOfcounsellor['rate']}', 28, FontWeight.w900),
                            ),
                            myText('per minute', 17, FontWeight.w400),
                            Container(height: 5)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height*0.09,
                  width: MediaQuery.of(context).size.width*0.8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.white.withOpacity(0.60),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      myText('Available at:', 19, FontWeight.w900),
                      GestureDetector(
                        onTap: () {
                          // TODO: Implement Call
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                              'assets/anonymous_profile_screen/call.png',
                              scale: 2.2,
                            ),
                            myText('Call', 16, FontWeight.w900),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // TODO: Implement Chat
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                              'assets/anonymous_profile_screen/chat.png',
                              scale: 2.2,
                            ),
                            myText('Chat', 16, FontWeight.w900),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(height: 20)
              ],
            ),
          ),
        )
    );
  }
}

Widget myText (String text, double size, FontWeight) {
  return Text(
    text,
    style: TextStyle(
        fontSize: size,
        fontWeight: FontWeight,
        fontFamily: 'Roboto',
        color: Colors.black,
        decoration: TextDecoration.none
    ),
  );
}
