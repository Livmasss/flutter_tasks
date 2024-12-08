import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task3/data/user_service.dart';
import 'package:flutter_task3/presentation/models/chat_message_model.dart';

class SupportChatService extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> sendMessage(ChatMessageModel message) async {
    _firestore.collection('messages').add({
      'text': message.text,
      'createdAt': Timestamp.now(),
      'userId': getUserId(),
    });
  }
}

Future<List<ChatMessageModel>> getSupportMessages() async {
  return [
    ChatMessageModel(text: "text"),
    ChatMessageModel(text: "text 2"),
  ];
}