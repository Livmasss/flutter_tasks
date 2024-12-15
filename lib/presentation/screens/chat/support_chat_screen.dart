import 'package:flutter/material.dart';
import 'package:flutter_task3/data/support_chat_service.dart';
import 'package:flutter_task3/presentation/screens/chat/chat_message.dart';

import '../../models/chat_message_model.dart';

class SupportChatScreen extends StatefulWidget {
  final String companionId;
  const SupportChatScreen({
    super.key,
    required this.companionId
  });

  @override
  State<SupportChatScreen> createState() => _SupportChatScreenState();
}

class _SupportChatScreenState extends State<SupportChatScreen> {
  List<ChatMessageModel> messages = [];
  final SupportChatService service = SupportChatService();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
        appBar: AppBar(
          title: const Text('Чат'),
        ),
        body: Column(
          children: [
            Expanded(
              child: ChatMessages(
                  companionId: widget.companionId
              ),
            ),
            NewChatMessage(
              chatService: service,
              companionId: widget.companionId,
            )
          ],
        ),
      )
    );
  }
}
