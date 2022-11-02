import 'dart:io';
import 'dart:typed_data';

late Socket socket;


class ChatClient {
  final Socket socket;
  final String address;
  final int port;
  late String name;

  ChatClient({
    required this.socket,
    required this.address,
    required this.port,
    required this.name,
  });
}

class MessageDetails {
  final ChatClient sender;
  final ChatClient receiver;
  final MessageInfos message;

  const MessageDetails({
    required this.sender,
    required this.receiver,
    required this.message,
  });
}

class MessageInfos {
  final String text;
  final DateTime date;
  final bool isSentByMe;
  const MessageInfos({
    required this.text,
    required this.date,
    required this.isSentByMe,
  });
}

List<MessageInfos> receivedMessages = [];
List<MessageInfos> sentMessages = [];


void onConnection(Socket socket) {
  socket.write("Joachim||_one_chat");

  socket.listen(
    // handle data from the server
    (Uint8List data) async {
      print(String.fromCharCodes(data));
    },
    onError: errorHandler,
    onDone: () => doneHandler(socket),
    cancelOnError: false,
  );
}

void dataHandler(data) {
  // print(String.fromCharCodes(data).trim());
  // handle data from the server

  (Uint8List data) async {
    print(String.fromCharCodes(data).trim());
  };
}

void errorHandler(error, StackTrace trace) {
  print(
      "Coucou !!!!!\n::::::::::::::::Here is the error::::::::::::\n$error\n:::::::::::::");
}

void doneHandler(Socket socket) {
  print('Good job Server!!!');
  // socket.destroy();
  connectionTask();
  // exit(0);
}

Future<void> sendMessage(String data) async {
  // stdin.readLineSync();
  socket.write('$data||_one_chat_message\n');
  await Future.delayed(Duration(milliseconds: 500));
}

connectionTask() async {
  try {
    Socket.connect("192.168.43.254", 4698).then((Socket sock) {
      socket = sock;
      onConnection(sock);
      // final String test = 'It Works bro';
      // return test;
    }).catchError((e) {
      print(
          ":::::::::::::\nUnable to connect to a server with the given port\n::::::::::::::\n$e\n:::::::::::::\n");
      // exit(1);
      connectionTask();
    });

    // socket = await Socket.connect("localhost", 4698);

    //Connect standard in to the socket

    // stdin.listen((data) async {
    //   await sendMessage(socket, data);
    // });
  } catch (e) {
    print(
        ":::::::::::::\nAn error occured when executing the client socket application\nHere's the error\n::::::::::::::\n$e\n:::::::::::::");
  }
}
