import 'package:chat_app/widgets/chat_bubble.dart';
import 'package:flutter/material.dart';

import 'models/chat_message_entity.dart';

class ChatPage extends StatelessWidget {
  final chatMessageController = TextEditingController();
  ChatPage({Key? key}) : super(key: key);

  final List<ChatMessageEntity> _messages = [
    ChatMessageEntity(
        text: "First Text",
        id: '1',
        createAt: 1432561542,
        author: Author(userName: "Deepali")),
    ChatMessageEntity(
        text: "Second Text",
        id: '2',
        createAt: 1432561542,
        author: Author(userName: "Deepthi")),
    ChatMessageEntity(
        text: "Third Text",
        id: '3',
        createAt: 1432561542,
        author: Author(userName: "Deepali")),
    ChatMessageEntity(
        text: "Fourth Text",
        id: '4',
        createAt: 1432561542,
        author: Author(userName: "Deepthi")),
  ];

  void onSendButtonPressed() {
    print("chatMessage: ${chatMessageController.text}");
  }

  Widget getChatBubble(alignment, text) {
    return Align(
      alignment: alignment,
      child: Container(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(text,
                style: const TextStyle(fontSize: 20, color: Colors.black)),
            Image.network('https://m.media-amazon.com/images/I/71+0RN7OEML.png')
          ],
        ),
        margin: const EdgeInsets.all(50),
        decoration: const BoxDecoration(
          color: Colors.cyan,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
              bottomLeft: Radius.circular(12)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final userName = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text('Hi $userName!', style: TextStyle(color: Colors.black)),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/');
                print('Logout initiated');
              },
              icon: const Icon(
                Icons.logout,
                color: Colors.black,
              ))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  return ChatBubble(
                  alignment: index % 2 ==0 ? Alignment.centerLeft
                      :  Alignment.centerRight,
                      entity: _messages[index]
                  );
                }),
          ),
          Container(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(onPressed: () {}, icon: Icon(Icons.add)),
                Expanded(
                    child: TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 5,
                  minLines: 1,
                  controller: chatMessageController,
                  textCapitalization: TextCapitalization.sentences,
                  style: TextStyle(color: Colors.black),
                  decoration: const InputDecoration(
                    hintText: "Type your message here",
                    hintStyle: TextStyle(color: Colors.blueGrey),
                    border: InputBorder.none,
                  ),
                )),
                IconButton(
                    onPressed: onSendButtonPressed, icon: Icon(Icons.send)),
              ],
            ),
            decoration: const BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
          )
        ],
      ),
    );
  }
}
