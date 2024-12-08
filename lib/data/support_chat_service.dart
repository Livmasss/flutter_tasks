import 'package:flutter_task3/presentation/models/chat_message_model.dart';

Future<List<ChatMessageModel>> getSupportMessages() async {
  return [
    ChatMessageModel(text: "text"),
    ChatMessageModel(text: "text 2"),
  ];
}