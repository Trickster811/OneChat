import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:one_chat/contants.dart';
import 'package:one_chat/functions.dart';

class HelpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          'Help',
          style: TextStyle(
            color: kPrimaryColor,
            fontSize: 25,
            fontFamily: 'Comfortaa_bold',
          ),
        ),
      ),
    );
  }
}
