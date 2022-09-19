import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:one_chat/functions.dart';
import 'package:one_chat/main.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          'About',
          style: TextStyle(
            color: Theme.of(context).iconTheme.color,
            fontSize: 25,
            fontFamily: 'Comfortaa_bold',
          ),
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            right: -MediaQuery.of(context).size.width * 0.8,
            bottom: 0,
            child: SvgPicture.asset(
              'assets/images/one_chat_logo.svg',
              color: Colors.white.withOpacity(0.4),
              // colorBlendMode: BlendMode.modulate,
              // width: MediaQuery.of(context).size.width * 3,
              height: MediaQuery.of(context).size.height * 0.6,
            ),
          ),
          SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Spacer(),
                  SvgPicture.asset(
                    'assets/images/one_chat_logo.svg',
                    height: 65,
                    width: 65,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'One Cloud',
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Comfortaa_bold',
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Work Social Network',
                    style: TextStyle(
                      fontSize: 10,
                      fontFamily: 'Comfortaa_bold',
                      // color: Colors.black45,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '1.0.0+1',
                    style: TextStyle(
                      fontSize: 10,
                      fontFamily: 'Comfortaa_bold',
                      // color: Colors.black45,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
