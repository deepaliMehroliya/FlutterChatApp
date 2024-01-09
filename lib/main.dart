import 'package:chat_app/chat_page.dart';
import 'package:flutter/material.dart';

import 'login_page.dart';

void main() {
  runApp(ChatApp());
}

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "Chat App!",
      theme: ThemeData(
          primarySwatch: Colors.blue,
          appBarTheme: const AppBarTheme( backgroundColor: Colors.blue, foregroundColor: Colors.black)),
      home: LoginPage(),
      routes: {
        '/chat': (context) => ChatPage(),
      },
    );
  }
}

