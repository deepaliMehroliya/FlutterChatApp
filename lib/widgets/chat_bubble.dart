import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/chat_message_entity.dart';

class ChatBubble extends StatelessWidget {

  final ChatMessageEntity entity;
  final Alignment alignment;

  const ChatBubble({ Key? key,required this.entity, required this.alignment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Container(
        padding: EdgeInsets.all(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('${entity.text}', style: const TextStyle(fontSize: 20, color: Colors.black)),
            if(entity.imageUrl!=null)
              Image.network('${entity.imageUrl}', height: 200,)
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
}
