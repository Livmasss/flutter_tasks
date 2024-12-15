import 'package:cloud_firestore/cloud_firestore.dart';

class ChatMessageModel {
  final String text;
  final String? receiver;

  ChatMessageModel({
    required this.text,
    this.receiver
  });

  static ChatMessageModel fromSnapshot(QueryDocumentSnapshot<Object?> snapshot) {
    return ChatMessageModel(
      text: snapshot['text'],
      receiver: snapshot['receiver']
    );
  }
}