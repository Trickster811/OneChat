import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grouped_list/grouped_list.dart';

import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:one_chat/contants.dart';
import 'package:one_chat/screens/chat_page.dart';

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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => Navigator.maybePop(context),
          icon: SvgPicture.asset(
            'assets/icons/arrow-left-2.2.svg',
            color: kPrimaryColor,
          ),
        ),
        title: Row(
          children: [
            ClipOval(
              child: Image.asset(
                widget.conversationInfo.image,
                fit: BoxFit.cover,
                height: 40,
                width: 40,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 8.0,
              ),
              child: Text(
                widget.conversationInfo.username,
                style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 15,
                  fontFamily: 'Comfortaa_bold',
                ),
              ),
            ),
          ],
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
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/icons/more-circle.1.svg',
              color: kPrimaryColor,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.white,
              child: GroupedListView<Message, DateTime>(
                padding: EdgeInsets.all(8.0),
                elements: messages,
                groupBy: (message) => DateTime(2022),
                groupHeaderBuilder: (Message message) => SizedBox(
                  height: 30,
                  child: Center(
                    child: Card(
                      color: kPrimaryColor,
                      child: Padding(
                        padding: EdgeInsets.all(2.0),
                        child: Text(
                          DateFormat.yMMMd().format(message.date),
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Comfortaa_light',
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                itemBuilder: (context, Message message) => Align(
                  alignment: message.isSentByMe
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 2.0),
                    child: Column(
                      crossAxisAlignment: message.isSentByMe
                          ? CrossAxisAlignment.end
                          : CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                            border: Border.all(),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text(message.text,
                                style: TextStyle(
                                  fontFamily: 'Comfortaa_regular',
                                )),
                          ),
                        ),
                        Text(
                          '7:36 PM',
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            // color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    'assets/icons/category.4.svg',
                    color: kPrimaryColor,
                  ),
                ),
                Flexible(
                  child: Container(
                    height: 30,
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
                      cursorColor: kPrimaryColor,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: kPrimaryColor.withOpacity(0.8),
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(1000.0),
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: kPrimaryColor.withOpacity(0.8),
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
                          fontFamily: 'Comfortaa_light',
                        ),
                      ),
                    ),
                  ),
                ),
                index == 0
                    ? IconButton(
                        onPressed: () {
                          pickImage(ImageSource.camera);
                        },
                        icon: SvgPicture.asset(
                          'assets/icons/camera.2.svg',
                          color: kPrimaryColor,
                        ),
                      )
                    : IconButton(
                        onPressed: () {
                          final message = Message(
                            text: inputController.text,
                            date: DateTime.now(),
                            isSentByMe: true,
                          );
                          setState(() {
                            messages.add(message);
                            inputController.clear();
                            index = 0;
                          });
                        },
                        icon: SvgPicture.asset(
                          'assets/icons/send.3.svg',
                          color: kPrimaryColor,
                        ),
                      ),
                index == 0
                    ? IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          'assets/icons/voice.svg',
                          color: kPrimaryColor,
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
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
              fontSize: 18,
              fontFamily: 'ArialRoundedBold',
            ),
          ),
          message: Text(
            'Sorry!! An error occured',
            style: TextStyle(
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
            color: kPrimaryColor,
          ),
        ),
        title: Text(
          'Edit Image',
          style: TextStyle(
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
