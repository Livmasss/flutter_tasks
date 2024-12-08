import 'package:flutter/material.dart';
import 'package:flutter_task3/data/support_chat_service.dart';
import 'package:flutter_task3/presentation/screens/chat/chat_message.dart';

import '../../models/chat_message_model.dart';

class SupportChatScreen extends StatefulWidget {
  const SupportChatScreen({super.key});

  @override
  State<SupportChatScreen> createState() => _SupportChatScreenState();
}

class _SupportChatScreenState extends State<SupportChatScreen> {
  List<ChatMessageModel> messages = [];
  
  @override
  void initState() {
    getSupportMessages().then((value) => setState(() {
      messages = value;
    }));
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Чат'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ChatMessages(messages: messages),
          ),
          const NewChatMessage(),
        ],
      ),
    );
  }
}
