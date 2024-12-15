import 'package:flutter/material.dart';

class AdminChatsListScreen extends StatefulWidget {
  const AdminChatsListScreen({super.key});

  @override
  State<AdminChatsListScreen> createState() => _AdminChatsListScreenState();
}

class _AdminChatsListScreenState extends State<AdminChatsListScreen> {
  List<String> chats = [
    "Chat 1",
    "Chat 2",
    "Chat 3",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: ListView.builder(
                itemCount: chats.length,
                itemBuilder: (BuildContext context, int index) => Column(
                  children: [
                    ChatItemWidget(userId: chats[index]),
                    const Divider()
                  ],
                )
            )
        )
    );
  }
}

class ChatItemWidget extends StatelessWidget {
  const ChatItemWidget({
    super.key,
    required this.userId
  });

  final String userId;

  @override
  Widget build(BuildContext context) {
    return  Text(userId);
  }
}

