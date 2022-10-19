import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:one_chat/main.dart';
import 'package:one_chat/screens/components/chat_pages/chat_space.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

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

class ChatScreen extends StatefulWidget {
  const ChatScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final inputController = TextEditingController();

  int index = 0;

  late final _listController = StreamChannelListController(
    client: StreamChat.of(context).client,
    filter: Filter.in_(
      'members',
      [StreamChat.of(context).currentUser!.id],
    ),
    sort: const [SortOption('last_message_at')],
    limit: 20,
  );

  @override
  void dispose() {
    _listController.dispose();
    super.dispose();
  }

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

    // return StreamChannelListView(
    //     controller: _listController,
    //     itemBuilder: _channelTileBuilder,
    //     onChannelTap: (channel) {
    //       Navigator.of(context).push(
    //         MaterialPageRoute(
    //           builder: (context) {
    //             return StreamChannel(
    //               channel: channel,
    //               child: ChannelPage(),
    //             );
    //           },
    //         ),
    //       );
    //     });

    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(100.0),
                ),
              ),
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    child: Container(
                      height: 40,
                      child: TextField(
                        controller: inputController,
                        onChanged: (String value) {
                          setState(() {
                            if (value != '') {
                              index = 1;
                            } else {
                              index = 0;
                            }
                          });
                          print(value);
                        },
                        onSubmitted: (String text) {},
                        cursorWidth: 1.0,
                        cursorColor: Theme.of(context).iconTheme.color,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context)
                                  .iconTheme
                                  .color!
                                  .withOpacity(0.8),
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(1000.0),
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context)
                                  .iconTheme
                                  .color!
                                  .withOpacity(0.8),
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(1000.0),
                            ),
                            // gapPadding: 2.0,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 2.0,
                            horizontal: 8.0,
                          ),
                          hintText: 'type a message',
                          hintStyle: TextStyle(
                            // color: kPrimaryColor,
                            fontFamily: 'Comfortaa_light',
                          ),
                        ),
                      ),
                    ),
                  ),
                  index == 0
                      ? IconButton(
                          onPressed: () {
                            // pickImage(ImageSource.camera);
                          },
                          icon: SvgPicture.asset(
                            'assets/icons/search.svg',
                            color: Theme.of(context).iconTheme.color,
                          ),
                        )
                      : IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            'assets/icons/send.3.svg',
                            color: Theme.of(context).iconTheme.color,
                            height: 40,
                            width: 40,
                          ),
                        ),
                ],
              ),
            ),
          ),
          for (var item in conversationInfo)
            conversationBuilder(context, screenWidth, item),
        ],
      ),
    );
  }

  Widget _channelTileBuilder(BuildContext context, List<Channel> channels,
      int index, StreamChannelListTile defaultChannelTile) {
    final channel = channels[index];
    final lastMessage = channel.state?.messages.reversed.firstWhere(
      (message) => !message.isDeleted,
    );

    final subtitle = lastMessage == null ? 'nothing yet' : lastMessage.text!;
    final opacity = (channel.state?.unreadCount ?? 0) > 0 ? 1.0 : 0.5;

    final theme = StreamChatTheme.of(context);

    return ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => StreamChannel(
              channel: channel,
              child: const ChannelPage(),
            ),
          ),
        );
      },
      leading: StreamChannelAvatar(
        channel: channel,
      ),
      title: StreamChannelName(
        channel: channel,
        textStyle: theme.channelPreviewTheme.titleStyle!.copyWith(
          color: theme.colorTheme.textHighEmphasis.withOpacity(opacity),
        ),
      ),
      subtitle: Text(subtitle),
      trailing: channel.state!.unreadCount > 0
          ? CircleAvatar(
              radius: 10,
              child: Text(channel.state!.unreadCount.toString()),
            )
          : const SizedBox(),
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

class ChannelPage extends StatelessWidget {
  const ChannelPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const StreamChannelHeader(),
      body: Column(
        children: const <Widget>[
          Expanded(
            child: StreamMessageListView(),
          ),
          StreamMessageInput(),
        ],
      ),
    );
  }
}
