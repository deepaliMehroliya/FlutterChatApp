import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {

  final chatMessageController = TextEditingController();
  ChatPage({Key? key}) : super(key: key);

  void onSendButtonPressed (){
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
            Text(text, style: const TextStyle(fontSize: 20, color: Colors.black)),
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
                itemCount: 10,
                itemBuilder: (context, index) {
                  return getChatBubble(
                      Alignment.centerLeft, "Hello, this is Deepali");
                }),
          ),
          Container(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(onPressed: () {}, icon: Icon(Icons.add)),
                Expanded(child: TextField(
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
                IconButton( onPressed: onSendButtonPressed, icon: Icon(Icons.send)),
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
