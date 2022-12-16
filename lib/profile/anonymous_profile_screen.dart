import 'package:flutter/material.dart';

class AnonymousProfileScreen extends StatefulWidget {
  const AnonymousProfileScreen({Key? key}) : super(key: key);

  @override
  State<AnonymousProfileScreen> createState() => _AnonymousProfileScreenState();
}

class _AnonymousProfileScreenState extends State<AnonymousProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Stack(
            children: [
              Column(
                children: [
                  Image.asset('name'),
                  Image.asset('name')
                ],
              ),
              Positioned(
                  child: Column(
                    children: [
                      Image.asset('name'),
                      Text('data'),
                      Text('data')
                    ],
                  )
              )
            ],
          ),
          Column(
            children: [
              Text('data'),
              Text('data')
            ],
          ),
          Row(
            children: [
              Column(
                children: [
                  Text('data'),
                  Text('data'),
                  Text('data')
                ],
              ),
              Column(
                children: [
                  Text('data'),
                  Text('data'),
                  Text('data')
                ],
              )
            ],
          ),
          Row(
            children: [
              Text('data'),
              Column(
                children: [
                  Image.asset('name'),
                  Text('data')
                ],
              ),
              Column(
                children: [
                  Image.asset('name'),
                  Text('data')
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
