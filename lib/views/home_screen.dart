import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:scroll_page_view/pager/page_controller.dart';
import 'package:scroll_page_view/pager/scroll_page_view.dart';
import 'package:untvoice/views/anonynmous_main_screen.dart';

import '../controller/data_controller.dart';

class HomeScreen extends StatefulWidget {
  static const _images = [
    'https://picjumbo.com/wp-content/uploads/the-golden-gate-bridge-sunset-1080x720.jpg',
    'https://cdn.mos.cms.futurecdn.net/Nxz3xSGwyGMaziCwiAC5WW-1024-80.jpg',
    'https://wallpaperaccess.com/full/19921.jpg',
    'https://images.pexels.com/photos/2635817/pexels-photo-2635817.jpeg?auto=compress&crop=focalpoint&cs=tinysrgb&fit=crop&fp-y=0.6&h=500&sharp=20&w=1400',
  ];

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final DataController controller = Get.put(DataController());

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await controller.getUserProfileData();
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF000026),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 200,
                        child: ScrollPageView(
                          controller: ScrollPageController(),
                          children: HomeScreen._images
                              .map((image) => _imageView(image))
                              .toList(),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Saturday, 03 September',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xFFB19A9A),
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Outfit',
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        'Hey,${controller.dataNotifier['first']}!',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Outfit',
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(() => screen2());},
                        child: Card(
                          heading: "Talk Anonymously",
                          content:
                          'Talk to someone who has faced the problem you\'re facing anonymously on call or chat.',
                          icon: 'assets/home_screen/anonymous.png',
                          backgroundColor: Color(0xff50C8AA),
                        ),

                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Card(
                        heading: 'Consult with the Professionals!',
                        content:
                        'Share your problems with the experts in the field.',
                        icon: 'assets/home_screen/professional.jpg',
                        backgroundColor: Color(0xffC688FC),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Card(
                        heading: 'Career Counselling',
                        content:
                        'Get help and consulatation from the experienced people to make the right career choice.',
                        icon: 'assets/home_screen/career.png',
                        backgroundColor: Color(0xffABA03A),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Card(
                        heading: 'Discussion Forum',
                        content:
                        'Discuss and share your problems and experiences in a shared forum with the community.',
                        icon: 'assets/home_screen/forum.png',
                        backgroundColor: Color(0xff7AAB3A),
                      ),
                      SizedBox(
                        height: 35,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 9),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10))),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Icon(
                        Icons.home,
                        color: Colors.white,
                        size: 23,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        'Home',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Outfit',
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.people,
                        color: Colors.white,
                        size: 23,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        'Community',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Outfit',
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.explore,
                        color: Colors.white,
                        size: 23,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text('Explore',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Outfit',
                          )),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.account_circle,
                        color: Colors.white,
                        size: 23,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text('Account',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Outfit',
                          )),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Card extends StatelessWidget {
  final String? heading;
  final String? content;
  final String? icon;
  final Color? backgroundColor;
  const Card({this.heading, this.content, this.icon, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      decoration: BoxDecoration(
          color: backgroundColor!,
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: Row(
        children: [
          Expanded(
            child: Container(
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      heading!,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 21,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Outfit'),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    content!,
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Outfit',
                        fontSize: 15),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(left: 3),
                    child: Image.asset(
                      'assets/home_screen/right.png',
                      width: 43,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 6),
            child: Image.asset(
              icon!,
              width: 65,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

Widget _imageView(String image) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8),
    child: ClipRRect(
      clipBehavior: Clip.antiAlias,
      borderRadius: BorderRadius.circular(8),
      child: Image.network(image, fit: BoxFit.cover),
    ),
  );
}
