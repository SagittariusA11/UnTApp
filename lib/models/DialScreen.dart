import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untvoice/views/dial_screen.dart';

import '../utils/size_config.dart';

class DialScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Body(),
    );
  }
}