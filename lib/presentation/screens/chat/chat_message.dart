import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task3/data/support_chat_service.dart';
import 'package:flutter_task3/presentation/models/chat_message_model.dart';

import '../../../data/user_service.dart';


class ChatMessages extends StatelessWidget {
  final String? companionId;
  String? userId;

  ChatMessages({
    super.key,
    required this.companionId
  }) {
    userId = getUserId();
    if (isAdmin()) {
      userId = companionId;
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection("chats")
          .doc(userId)
          .collection("messages")
          .orderBy('createdAt', descending: true)
          .snapshots(),
      builder: (ctx, AsyncSnapshot<QuerySnapshot> chatSnapshot) {
        if (chatSnapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        if (chatSnapshot.data == null) {
          return const CircularProgressIndicator();
        }

        final docs = chatSnapshot.data!.docs;
        return ListView.builder(
            reverse: true,
            itemCount: docs.length,
            itemBuilder: (context, index) =>
                ChatMessage(message: ChatMessageModel.fromSnapshot(docs[index]))
        );
      },
    );
  }
}

class ChatMessage extends StatelessWidget {
  final ChatMessageModel message;
  Alignment? alignment;
  CrossAxisAlignment axisAlignment = CrossAxisAlignment.start;

  ChatMessage({
    super.key,
    required this.message
  }) {
    if (message.receiver == getUserId()) {
      alignment = Alignment.topRight;
      axisAlignment = CrossAxisAlignment.end;
    }
    else {
      alignment = Alignment.topLeft;
      axisAlignment = CrossAxisAlignment.start;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: SizedBox(
        width: 300,
        child: Column(
          crossAxisAlignment: axisAlignment,
          children: [
            Text(
                message.text,
                style: const TextStyle(
                  fontSize: 22
                ),
            ),
            Text(
                "${message.sentDate?.hour} : ${message.sentDate?.minute}",
                textAlign: TextAlign.end
            ),
          ],
        ),
      ),
    );
  }
}


class NewChatMessage extends StatelessWidget {
  final SupportChatService chatService;
  final String? companionId;
  NewChatMessage({
    super.key,
    required this.chatService,
    this.companionId
  });

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: TextField(
              controller: controller,
              onChanged: (value) {
                // controller.text = value;
              },
            )
        ),
        IconButton(
            onPressed: () {
              String receiverId = companionId ?? getAdminId();

              ChatMessageModel message = ChatMessageModel(
                  text: controller.text,
                  receiver: receiverId
              );

              chatService.sendMessage(message);
              controller.text = "";
            },
            icon: const Icon(Icons.send)
        )
      ],
    );
  }
}

