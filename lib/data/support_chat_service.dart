import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task3/data/user_service.dart';
import 'package:flutter_task3/presentation/models/chat_message_model.dart';

class SupportChatService extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> sendMessage(ChatMessageModel message) async {
    String receiver;
    if (message.receiver == null)
      receiver = getAdminId();
    else
      receiver = message.receiver!;

    if (getUserId() != getAdminId())
      receiver = getAdminId();

    var userId = getUserId();
    if (isAdmin()) {
      userId = receiver;
    }

    _firestore.collection("chats")
        .doc(userId)
        .collection("messages")
        .add({
          'text': message.text,
          'createdAt': Timestamp.now(),
          'userId': getUserId(),
          'receiver': receiver
        });

    Future<List<ChatMessageModel>> getSupportMessages() async {
      return [
        ChatMessageModel(text: "text"),
        ChatMessageModel(text: "text 2"),
      ];
    }
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getAllChats() {
    final snapshot = _firestore.collection("chats").snapshots();
    return snapshot;
  }
}