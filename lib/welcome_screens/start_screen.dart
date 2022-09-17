import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:one_chat/contants.dart';
import 'package:one_chat/functions.dart';
import 'package:one_chat/screens/account_page.dart';
import 'package:one_chat/screens/chat_page.dart';
import 'package:one_chat/screens/components/account_pages/about_page.dart';
import 'package:one_chat/screens/components/account_pages/settings_page.dart';
import 'package:one_chat/screens/components/scan_page.dart';
import 'package:one_chat/screens/search_page.dart';
import 'package:one_chat/screens/storie_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _incrementCounter() {
    setState(() {
      // _counter++;
    });
  }

  int index = 0;
  double appBarHeightSize = 0;

  final screens = [
    ChatScreen(),
    StorieScreen(),
    SearchScreen(),
    AccountScreen(),
  ];

  final screenName = [
    'One Chat',
    'Status',
    'Search',
    'Account',
  ];

  List<List> menuItemList = [
    [
      'assets/icons/scan.svg',
      'Scan to connect',
      ScanScreen(),
    ],
    [
      'assets/icons/setting.2.svg',
      'Settings',
      SettingsScreen(),
    ],
    [
      'assets/icons/info-square.4.svg',
      'About',
      AboutScreen(),
    ],
  ];

  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(
        screenName[index],
        style: TextStyle(
          color: kPrimaryColor,
          fontSize: 25,
          fontFamily: 'Comfortaa_bold',
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            'assets/icons/search.svg',
            color: kPrimaryColor,
          ),
        ),
        IconButton(
          onPressed: () {
            UsualFunctions.openDialog(context, menuItemList, appBarHeightSize);
          },
          icon: SvgPicture.asset(
            'assets/icons/more-circle.1.svg',
            color: kPrimaryColor,
          ),
        ),
      ],
    );
    return Scaffold(
      appBar: appBar,
      body: index != 4
          ? screens[index]
          : index != 5
              ? screens[index]
              : Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  child: screens[index],
                ),
      bottomNavigationBar: BottomAppBar(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        // color: kSecondaryColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  appBarHeightSize = appBar.preferredSize.height;
                  index = 0;
                });
              },
              icon: Center(
                child: Column(
                  children: [
                    index == 0
                        ? Badge(
                            animationType: BadgeAnimationType.scale,
                            badgeColor: Colors.blueAccent,
                            // position: BadgePosition.center(),
                            badgeContent: Text(
                              '99+',
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                            child: SvgPicture.asset(
                              'assets/icons/chat.5.svg',
                              color: kPrimaryColor,
                            ),
                          )
                        : Badge(
                            animationType: BadgeAnimationType.scale,
                            badgeColor: Colors.blueAccent,
                            // position: BadgePosition.center(),
                            badgeContent: Text(
                              '99+',
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                            child: SvgPicture.asset(
                              'assets/icons/chat.6.svg',
                              color: kPrimaryColor,
                            ),
                          ),
                    Spacer(),
                    Text(
                      'Chats',
                      style: TextStyle(
                        fontSize: 7,
                        fontFamily: 'Comfortaa_bold',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  appBarHeightSize = appBar.preferredSize.height;
                  index = 1;
                });
              },
              icon: Column(
                children: [
                  index == 1
                      ? SvgPicture.asset(
                          'assets/icons/plus.3.svg',
                          color: kPrimaryColor,
                        )
                      : SvgPicture.asset(
                          'assets/icons/plus.1.svg',
                          color: kPrimaryColor,
                        ),
                  Spacer(),
                  Text(
                    'Status',
                    style: TextStyle(
                      fontSize: 7,
                      fontFamily: 'Comfortaa_bold',
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  appBarHeightSize = appBar.preferredSize.height;
                  index = 2;
                });
              },
              icon: Column(
                children: [
                  index == 2
                      ? SvgPicture.asset(
                          'assets/icons/search.6.svg',
                          color: kPrimaryColor,
                        )
                      : SvgPicture.asset(
                          'assets/icons/search.svg',
                          color: kPrimaryColor,
                        ),
                  Spacer(),
                  Text(
                    'Search',
                    style: TextStyle(
                      fontSize: 7,
                      fontFamily: 'Comfortaa_bold',
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  appBarHeightSize = appBar.preferredSize.height;
                  index = 3;
                });
              },
              icon: Column(
                children: [
                  index == 3
                      ? SvgPicture.asset(
                          'assets/icons/profile.3.svg',
                          color: kPrimaryColor,
                        )
                      : SvgPicture.asset(
                          'assets/icons/profile.4.svg',
                          color: kPrimaryColor,
                        ),
                  Spacer(),
                  Text(
                    'Account',
                    style: TextStyle(
                      fontSize: 7,
                      fontFamily: 'Comfortaa_bold',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
