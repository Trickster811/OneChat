import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:one_chat/main.dart';
import 'package:one_chat/screens/components/chat_pages/chat_space.dart';

class ConversationInfo {
  final String image, username, message, time, badge;

  const ConversationInfo({
    Key? key,
    required this.image,
    required this.username,
    required this.message,
    required this.time,
    required this.badge,
  });
}

class ChatScreen extends StatelessWidget {
  const ChatScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final List conversationInfo = [
      ConversationInfo(
        image: 'assets/images/1.png',
        username: '@Ulrich',
        message: 'Ecris fort!!! Je suis dans les bruits bro',
        time: '7:45 PM',
        badge: '02',
      ),
      ConversationInfo(
        image: 'assets/images/6.png',
        username: '@Youmix',
        message: 'Je passe chez toi ce soir',
        time: '7:45 PM',
        badge: '10',
      ),
      ConversationInfo(
        image: 'assets/images/girl_studying_with_music.png',
        username: '@Julie',
        message: 'Salut',
        time: '7:45 PM',
        badge: '07',
      ),
      ConversationInfo(
        image: 'assets/images/4.png',
        username: '@Nancy',
        message: 'Cc ma puce!!',
        time: '7:45 PM',
        badge: '15',
      ),
      ConversationInfo(
        image: 'assets/images/2.png',
        username: '@Johannes',
        message: 'Bonjour!',
        time: '7:45 PM',
        badge: '04',
      ),
      ConversationInfo(
        image: 'assets/images/5.png',
        username: '@Bro',
        message: 'Go kass',
        time: '7:45 PM',
        badge: '02',
      ),
      ConversationInfo(
        image: 'assets/images/3.png',
        username: '@Manou',
        message: 'Gars รงa a cuit!! run seulement',
        time: '7:45 PM',
        badge: '10',
      ),
      ConversationInfo(
        image: 'assets/images/7.png',
        username: '@Julienne',
        message: 'Salut',
        time: '7:45 PM',
        badge: '07',
      ),
      ConversationInfo(
        image: 'assets/images/8.png',
        username: '@Junior',
        message: 'Yo odk',
        time: '7:45 PM',
        badge: '15',
      ),
      ConversationInfo(
        image: 'assets/images/10.png',
        username: '@Anne',
        message: 'Bonjour!',
        time: '7:45 PM',
        badge: '04',
      ),
    ];

    return SingleChildScrollView(
      child: Column(
        children: [
          for (var item in conversationInfo)
            conversationBuilder(context, screenWidth, item),
        ],
      ),
    );
  }

  Widget conversationBuilder(
    BuildContext context,
    double screenWidth,
    @required ConversationInfo item,
  ) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ChatSpace(conversationInfo: item)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 2.0,
        ),
        child: Row(
          children: [
            ClipOval(
              child: Image.asset(
                item.image,
                fit: BoxFit.cover,
                height: 50,
                width: 50,
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 8.0,
                ),
                height: (screenWidth / 100) * 15,
                // width: (screenWidth / 100) * 65,
                // color: Colors.red,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Spacer(),
                    Text(
                      item.username,
                      style: TextStyle(
                        // color: kPrimaryColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    // Spacer(),

                    Text(
                      item.message,
                      style: TextStyle(
                          // color: kPrimaryColor,
                          ),
                    ),
                    // Spacer(),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                Text(item.time),
                Badge(
                  animationType: BadgeAnimationType.scale,
                  badgeColor: Colors.blueAccent,
                  position: BadgePosition.center(),
                  badgeContent: Text(
                    item.badge,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 10,
                    ),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      'assets/icons/arrow-right-2.4.svg',
                      color: Theme.of(context).iconTheme.color,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
