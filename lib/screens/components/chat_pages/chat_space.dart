import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grouped_list/grouped_list.dart';

import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:one_chat/constant.dart';
import 'package:one_chat/main.dart';
import 'package:one_chat/screens/chat_page.dart';
import 'package:provider/provider.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class ChatSpace extends StatefulWidget {
  final ConversationInfo conversationInfo;

  const ChatSpace({
    Key? key,
    required this.conversationInfo,
  }) : super(key: key);

  @override
  State<ChatSpace> createState() => _ChatSpaceState();
}

class _ChatSpaceState extends State<ChatSpace> {
  int index = 0;
  List<Message> messages = [
    Message(
      text: 'Morning',
      date: DateTime.now().subtract(Duration(minutes: 1)),
      isSentByMe: false,
    ),
    Message(
      text: "What's up?",
      date: DateTime.now().subtract(Duration(minutes: 2)),
      isSentByMe: true,
    ),
    Message(
      text: 'What a good day to go outside ggggggg!!',
      date: DateTime.now().subtract(Duration(minutes: 1)),
      isSentByMe: false,
    ),
    Message(
      text: 'Yes sure',
      date: DateTime.now().subtract(Duration(minutes: 1)),
      isSentByMe: true,
    ),
    Message(
      text: 'Wanna join us today',
      date: DateTime.now().subtract(Duration(minutes: 1)),
      isSentByMe: false,
    ),
    Message(
      text: 'Yes sure',
      date: DateTime.now().subtract(Duration(minutes: 1)),
      isSentByMe: false,
    ),
    Message(
      text: 'Yes sure',
      date: DateTime.now().subtract(Duration(minutes: 1)),
      isSentByMe: true,
    ),
    Message(
      text: 'Yes sure',
      date: DateTime.now().subtract(Duration(minutes: 1)),
      isSentByMe: false,
    ),
    Message(
      text: 'Yes sure',
      date: DateTime.now().subtract(Duration(minutes: 1)),
      isSentByMe: false,
    ),
    Message(
      text: 'Yes sure',
      date: DateTime.now().subtract(Duration(minutes: 1)),
      isSentByMe: false,
    ),
    Message(
      text: 'Yes sure',
      date: DateTime.now().subtract(Duration(minutes: 1)),
      isSentByMe: true,
    ),
  ].reversed.toList();

  File? image;
  final inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      // backgroundColor: Colors.amberAccent,
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   automaticallyImplyLeading: false,
      //   leading: IconButton(
      //     onPressed: () => Navigator.maybePop(context),
      //     icon: SvgPicture.asset(
      //       'assets/icons/arrow-left-2.2.svg',
      //       color: Theme.of(context).iconTheme.color!,
      //     ),
      //   ),
      //   title: Row(
      //     children: [
      //       ClipOval(
      //         child: Image.asset(
      //           widget.conversationInfo.image,
      //           fit: BoxFit.cover,
      //           height: 40,
      //           width: 40,
      //         ),
      //       ),
      //       Padding(
      //         padding: EdgeInsets.symmetric(
      //           horizontal: 8.0,
      //         ),
      //         child: Column(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: <Widget>[
      //             Text(
      //               widget.conversationInfo.username,
      //               style: TextStyle(
      //                 // color: kPrimaryColor,
      //                 fontSize: 15,
      //                 fontFamily: 'Comfortaa_bold',
      //               ),
      //             ),
      //             SizedBox(
      //               height: 6,
      //             ),
      //             Text(
      //               "Online",
      //               style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
      //             ),
      //           ],
      //         ),
      //       ),
      //     ],
      //   ),
      //   actions: [
      //     IconButton(
      //       onPressed: () {},
      //       icon: SvgPicture.asset(
      //         'assets/icons/search.svg',
      //         color: Theme.of(context).iconTheme.color!,
      //       ),
      //     ),
      //     IconButton(
      //       onPressed: () {},
      //       icon: SvgPicture.asset(
      //         'assets/icons/more-circle.1.svg',
      //         color: Theme.of(context).iconTheme.color!,
      //       ),
      //     ),
      //   ],
      // ),
      appBar: StreamChannelHeader(),
      body: Column(
        children: [
          // Expanded(
          //   child: Container(
          //     child: GroupedListView<Message, DateTime>(
          //       padding: EdgeInsets.all(8.0),
          //       elements: messages,
          //       groupBy: (message) => DateTime(2022),
          //       groupHeaderBuilder: (Message message) => SizedBox(
          //         height: 30,
          //         child: Center(
          //           child: Card(
          //             color: Theme.of(context).primaryColor,
          //             child: Padding(
          //               padding: EdgeInsets.all(2.0),
          //               child: Text(
          //                 DateFormat.yMMMd().format(message.date),
          //                 style: TextStyle(
          //                   // color: kPrimaryColor,
          //                   fontFamily: 'Comfortaa_light',
          //                 ),
          //               ),
          //             ),
          //           ),
          //         ),
          //       ),
          //       itemBuilder: (context, Message message) => Align(
          //         alignment: message.isSentByMe
          //             ? Alignment.centerRight
          //             : Alignment.centerLeft,
          //         child: Padding(
          //           padding: EdgeInsets.symmetric(vertical: 2.0),
          //           child: Column(
          //             crossAxisAlignment: message.isSentByMe
          //                 ? CrossAxisAlignment.end
          //                 : CrossAxisAlignment.start,
          //             children: [
          //               Container(
          //                 padding: EdgeInsets.all(5.0),
          //                 margin: EdgeInsets.symmetric(vertical: 5.0),
          //                 decoration: BoxDecoration(
          //                   borderRadius:
          //                       BorderRadius.all(Radius.circular(1000.0)),
          //                   color: message.isSentByMe
          //                       ? Theme.of(context).primaryColor
          //                       : Theme.of(context).iconTheme.color,
          //                 ),
          //                 child: Padding(
          //                   padding: EdgeInsets.all(5.0),
          //                   child: Text(
          //                     message.text,
          //                     style: TextStyle(
          //                       color: !message.isSentByMe
          //                           ? Provider.of<ThemeProvider>(context)
          //                                       .themeMode ==
          //                                   ThemeMode.light
          //                               ? Colors.white
          //                               : Colors.black
          //                           : Theme.of(context).iconTheme.color,
          //                       fontFamily: 'Comfortaa_regular',
          //                     ),
          //                   ),
          //                 ),
          //               ),
          //               Text(
          //                 '7:36 PM',
          //                 style: TextStyle(
          //                   // color: kPrimaryColor,
          //                   fontSize: 10,
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          // Container(
          //   // color: Colors.white,
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //     children: [
          //       IconButton(
          //         onPressed: () {},
          //         icon: SvgPicture.asset(
          //           'assets/icons/category.4.svg',
          //           color: Theme.of(context).iconTheme.color!,
          //         ),
          //       ),
          //       Flexible(
          //         child: Container(
          //           height: 30,
          //           child: TextField(
          //             controller: inputController,
          //             onChanged: (String value) {
          //               setState(() {
          //                 if (value != '') {
          //                   index = 1;
          //                 } else {
          //                   index = 0;
          //                 }
          //               });
          //               print(value);
          //             },
          //             onSubmitted: (String text) {},
          //             cursorWidth: 1.0,
          //             cursorColor: Theme.of(context).iconTheme.color,
          //             decoration: InputDecoration(
          //               focusedBorder: OutlineInputBorder(
          //                 borderSide: BorderSide(
          //                   color: Theme.of(context)
          //                       .iconTheme
          //                       .color!
          //                       .withOpacity(0.8),
          //                 ),
          //                 borderRadius: BorderRadius.all(
          //                   Radius.circular(1000.0),
          //                 ),
          //               ),
          //               border: OutlineInputBorder(
          //                 borderSide: BorderSide(
          //                   color: Theme.of(context)
          //                       .iconTheme
          //                       .color!
          //                       .withOpacity(0.8),
          //                 ),
          //                 borderRadius: BorderRadius.all(
          //                   Radius.circular(1000.0),
          //                 ),
          //                 // gapPadding: 2.0,
          //               ),
          //               contentPadding: EdgeInsets.symmetric(
          //                 vertical: 2.0,
          //                 horizontal: 8.0,
          //               ),
          //               hintText: 'type a message',
          //               hintStyle: TextStyle(
          //                 // color: kPrimaryColor,
          //                 fontFamily: 'Comfortaa_light',
          //               ),
          //             ),
          //           ),
          //         ),
          //       ),
          //       index == 0
          //           ? IconButton(
          //               onPressed: () {
          //                 pickImage(ImageSource.camera);
          //               },
          //               icon: SvgPicture.asset(
          //                 'assets/icons/camera.2.svg',
          //                 color: Theme.of(context).iconTheme.color!,
          //               ),
          //             )
          //           : IconButton(
          //               onPressed: () {
          //                 final message = Message(
          //                   text: inputController.text,
          //                   date: DateTime.now(),
          //                   isSentByMe: true,
          //                 );
          //                 setState(() {
          //                   messages.add(message);
          //                   inputController.clear();
          //                   index = 0;
          //                 });
          //               },
          //               icon: SvgPicture.asset(
          //                 'assets/icons/send.3.svg',
          //                 color: Theme.of(context).iconTheme.color!,
          //               ),
          //             ),
          //       index == 0
          //           ? IconButton(
          //               onPressed: () {},
          //               icon: SvgPicture.asset(
          //                 'assets/icons/voice.svg',
          //                 color: Theme.of(context).iconTheme.color!,
          //               ),
          //             )
          //           : Container(),
          //     ],
          //   ),
          // ),
          Expanded(
            child: StreamMessageListView(),
          ),
          StreamMessageInput(),
        ],
      ),
    );
  }

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      final imageTemporary = File(image.path);
      // setState(() {
      //   this.image = imageTemporary;
      // });
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EditPageScreen(image: imageTemporary),
        ),
      );
    } on PlatformException catch (e) {
      showCupertinoModalPopup(
        context: context,
        builder: (context) => CupertinoActionSheet(
          title: Text(
            'Oups!!',
            style: TextStyle(
              // color: kPrimaryColor,
              fontSize: 18,
              fontFamily: 'ArialRoundedBold',
            ),
          ),
          message: Text(
            'Sorry!! An error occured',
            style: TextStyle(
              // color: kPrimaryColor,
              fontSize: 14,
              fontFamily: 'ArialRoundedBold',
            ),
          ),
          actions: [
            CupertinoActionSheetAction(
              // onPressed: () => imageGallerypicker(ImageSource.camera, context),
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Retry'),
            ),
          ],
        ),
      );
    }
  }
}

class Message {
  final String text;
  final DateTime date;
  final bool isSentByMe;
  const Message({
    required this.text,
    required this.date,
    required this.isSentByMe,
  });
}

class EditPageScreen extends StatelessWidget {
  final File image;

  const EditPageScreen({Key? key, required this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final inputController1 = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.black,
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.maybePop(context),
          icon: SvgPicture.asset(
            'assets/icons/arrow-left.svg',
            color: Theme.of(context).iconTheme.color!,
          ),
        ),
        title: Text(
          'Edit Image',
          style: TextStyle(
            // color: kPrimaryColor,
            fontFamily: 'Comfortaa_regular',
            fontSize: 16,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/icons/edit.6.svg',
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Image.file(
              image,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            // color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  child: Container(
                    height: 30,
                    child: TextField(
                      controller: inputController1,
                      onChanged: (String value) {
                        print(value);
                      },
                      onSubmitted: (String text) {},
                      cursorWidth: 1.0,
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        focusColor: Colors.white,
                        fillColor: Color.fromARGB(255, 255, 255, 255),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white.withOpacity(0.8),
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(1000.0),
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white.withOpacity(0.8),
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
                IconButton(
                  onPressed: () {
                    // final message = Message(
                    //   text: inputController.text,
                    //   date: DateTime.now(),
                    //   isSentByMe: true,
                    // );
                    // setState(() {
                    //   messages.add(message);
                    //   inputController.clear();
                    //   index = 0;
                    // });
                  },
                  icon: SvgPicture.asset(
                    'assets/icons/send.3.svg',
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
