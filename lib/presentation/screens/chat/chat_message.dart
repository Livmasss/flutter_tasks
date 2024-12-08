import 'package:flutter/material.dart';

import '../../models/chat_message_model.dart';

class ChatMessages extends StatelessWidget {
  final List<ChatMessageModel> messages;

  const ChatMessages({
    super.key,
    required this.messages
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (context, index) => Text(messages[index].text)
    );
  }
}

class NewChatMessage extends StatelessWidget {

  const NewChatMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text("message.text");
  }
}

