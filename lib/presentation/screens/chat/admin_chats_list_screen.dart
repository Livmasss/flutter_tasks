import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task3/data/support_chat_service.dart';
import 'package:flutter_task3/presentation/screens/chat/support_chat_screen.dart';

class AdminChatsListScreen extends StatefulWidget {
  const AdminChatsListScreen({super.key});

  @override
  State<AdminChatsListScreen> createState() => _AdminChatsListScreenState();
}

class _AdminChatsListScreenState extends State<AdminChatsListScreen> {
  SupportChatService chatService = SupportChatService();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: StreamBuilder(
              stream: chatService.getAllChats(),
              builder: (ctx, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                }
                if (snapshot.data == null) {
                  return const CircularProgressIndicator();
                }

                final docs = snapshot.data!.docs;

                return ListView.builder(
                    itemCount: docs.length,
                    itemBuilder: (BuildContext context, int index) => Column(
                      children: [
                        ChatItemWidget(userId: docs[index].id),
                        const Divider()
                      ],
                    )
                );
              },
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
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
          return SupportChatScreen(
            companionId: userId,
          );
        }));
      },
      child: Text(userId),
    );
  }
}
