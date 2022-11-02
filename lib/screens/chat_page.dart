import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:one_chat/screens/components/chat_pages/chat_space.dart';
import 'package:one_chat/screens/components/chat_pages/components/archived_conversation_page.dart';
import 'package:socket_client/socket_client.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class ConversationInfo {
  final String image, username, badge;
  final List message;

  const ConversationInfo({
    Key? key,
    required this.image,
    required this.username,
    required this.message,
    required this.badge,
  });
}



List<MessageInfos> messages = [
  MessageInfos(
    text: 'Hey bro!!',
    date: DateTime.now().subtract(Duration(minutes: 1)),
    isSentByMe: false,
  ),
  MessageInfos(
    text: "What's up?",
    date: DateTime.now().subtract(Duration(minutes: 2)),
    isSentByMe: true,
  ),
  MessageInfos(
    text:
        'What a good day to go outside hgcgoahehiohfqbfioeohiappvviovbeskbdv ggggggg!!',
    date: DateTime.now().subtract(Duration(minutes: 1)),
    isSentByMe: false,
  ),
  MessageInfos(
    text: 'Yes sure',
    date: DateTime.now().subtract(Duration(minutes: 1)),
    isSentByMe: true,
  ),
  MessageInfos(
    text: 'Wanna join us today',
    date: DateTime.now().subtract(Duration(minutes: 1)),
    isSentByMe: false,
  ),
  MessageInfos(
    text: 'Yes sure',
    date: DateTime.now().subtract(Duration(minutes: 1)),
    isSentByMe: false,
  ),
  MessageInfos(
    text: 'Yes sure',
    date: DateTime.now().subtract(Duration(minutes: 1)),
    isSentByMe: true,
  ),
  MessageInfos(
    text: 'Yes sure',
    date: DateTime.now().subtract(Duration(minutes: 1)),
    isSentByMe: false,
  ),
  MessageInfos(
    text: 'Yes sure',
    date: DateTime.now().subtract(Duration(minutes: 1)),
    isSentByMe: false,
  ),
  MessageInfos(
    text: 'Yes sure',
    date: DateTime.now().subtract(Duration(minutes: 1)),
    isSentByMe: false,
  ),
  MessageInfos(
    text: 'Yes sure',
    date: DateTime.now().subtract(Duration(minutes: 1)),
    isSentByMe: true,
  ),
].reversed.toList();

List archivedConversationInfo = [];

List conversationInfo = [
  ConversationInfo(
    image: 'assets/images/1.png',
    username: '@Ulrich',
    message: messages,
    badge: '02',
  ),
  ConversationInfo(
    image: 'assets/images/6.png',
    username: '@Youmix',
    message: messages,
    badge: '10',
  ),
  ConversationInfo(
    image: 'assets/images/girl_studying_with_music.png',
    username: '@Julie',
    message: messages,
    badge: '07',
  ),
  ConversationInfo(
    image: 'assets/images/4.png',
    username: '@Nancy',
    message: messages,
    badge: '15',
  ),
  ConversationInfo(
    image: 'assets/images/2.png',
    username: '@Johannes',
    message: messages,
    badge: '04',
  ),
  ConversationInfo(
    image: 'assets/images/5.png',
    username: '@Bro',
    message: messages,
    badge: '02',
  ),
  ConversationInfo(
    image: 'assets/images/3.png',
    username: '@Manou',
    message: messages,
    badge: '10',
  ),
  ConversationInfo(
    image: 'assets/images/7.png',
    username: '@Julienne',
    message: messages,
    badge: '07',
  ),
  ConversationInfo(
    image: 'assets/images/8.png',
    username: '@Junior',
    message: messages,
    badge: '15',
  ),
  ConversationInfo(
    image: 'assets/images/10.png',
    username: '@Anne',
    message: messages,
    badge: '04',
  ),
];

class ChatScreen extends StatefulWidget {
  final double appBarHeightSize;
  const ChatScreen({
    Key? key,
    required this.appBarHeightSize,
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
          archivedConversationInfo.length > 0
              ? InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ArchivedConversationScreen(
                              appBarHeightSize: widget.appBarHeightSize),
                        ));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.0,
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/download.2.svg',
                            color: Theme.of(context).iconTheme.color,
                            // height: 30,
                            // width: 30,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: SizedBox(
                              height: 70,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Archived',
                                    style: TextStyle(
                                      // color: kPrimaryColor,
                                      fontSize: 15,
                                      fontFamily: 'Comfortaa_regular',
                                    ),
                                  ),
                                  SvgPicture.asset(
                                    'assets/icons/arrow-right-circle.4.svg',
                                    height: 20,
                                    width: 20,
                                    color: Theme.of(context)
                                        .iconTheme
                                        .color!
                                        .withOpacity(0.7),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              : Container(),
          for (var item in conversationInfo)
            Dismissible(
                key: ValueKey<int>(conversationInfo.indexOf(item)),
                direction: DismissDirection.horizontal,
                secondaryBackground: Container(
                  color: Colors.red,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/delete.3.svg',
                        color: Colors.white,
                        height: 30,
                        width: 30,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ),
                background: Container(
                  color: Colors.blue,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      SvgPicture.asset(
                        'assets/icons/download.2.svg',
                        color: Colors.white,
                        height: 30,
                        width: 30,
                      ),
                    ],
                  ),
                ),
                onDismissed: (DismissDirection direction) => setState(
                      () {
                        if (direction == DismissDirection.endToStart) {
                          conversationInfo.remove(item);
                        } else {
                          conversationInfo.remove(item);
                          archivedConversationInfo.add(item);
                        }
                      },
                    ),
                child: conversationBuilder(context, screenWidth, item)),
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
    ConversationInfo item,
  ) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ChatSpace(
            conversationInfo: item,
            message: messages,
            appBarHeightSize: widget.appBarHeightSize,
          ),
        ),
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
                  vertical: 4.5,
                ),
                height: 50,
                // width: (screenWidth / 100) * 65,
                // color: Colors.red,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      item.message.last.text,
                    ),
                    // Spacer(),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                Text(
                  DateFormat.Hm().format(item.message.last.date),
                ),
                Badge(
                  animationType: BadgeAnimationType.scale,
                  badgeColor: Colors.blueAccent,
                  position: BadgePosition.center(),
                  badgeContent: Text(
                    item.message.length.toString(),
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
