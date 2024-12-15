import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../data/user_service.dart';


class ChatMessages extends StatelessWidget {
  const ChatMessages({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection("chats")
          .doc(getUserId())
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
            itemBuilder: (context, index) => Text(docs[index]['text'])
        );
      },
    );
  }
}

class NewChatMessage extends StatelessWidget {
  const NewChatMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(

    );
  }
}

