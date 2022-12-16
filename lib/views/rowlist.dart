import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RelatedList extends StatefulWidget {
  @override
  State<RelatedList> createState() => _RelatedListState();
}

class CardItem {
  final String imageUrl;

  const CardItem({
    required this.imageUrl,
  });
}

class _RelatedListState extends State<RelatedList> {
  List<CardItem> items = [
    const CardItem(imageUrl: 'assets/images/Ellipse2.png'),
    const CardItem(imageUrl: 'assets/images/Ellipse3.png'),
    const CardItem(imageUrl: 'assets/images/Ellipse4.png'),
    const CardItem(imageUrl: 'assets/images/Ellipse5.png'),
    const CardItem(imageUrl: 'assets/images/Ellipse6.png'),
    const CardItem(imageUrl: 'assets/images/Ellipse7.png'),
    const CardItem(imageUrl: 'assets/images/Ellipse6 (2).png'),
    const CardItem(imageUrl: 'assets/images/Ellipse6 (3).png'),
    const CardItem(imageUrl: 'assets/images/Ellipse6 (4).png'),
  ];

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => Container(
        width: 360,
        height: 53,
        child: SizedBox(
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: 9,
            separatorBuilder: (context, _) => const SizedBox(width: 5),
            itemBuilder: (context, index) => buildCard(items[index]),
          ),
        ),
      ),
      designSize: const Size(360, 53),
    );
  }

  Widget buildCard(CardItem item) => Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.elliptical(54, 53)),
    ),
    child: Padding(
      padding: EdgeInsets.only(left: 10),
      child: Row(
        children: [
          Container(
              width: 54,
              height: 53,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(item.imageUrl), fit: BoxFit.fitWidth),
                borderRadius: BorderRadius.all(Radius.elliptical(54, 53)),
              ))
        ],
      ),
    ),
  );
}
