import 'dart:developer';
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../datasources/local/dummy_data.dart';

class MessagesBottomSheet extends StatefulWidget {
  @override
  _MessagesBottomSheetState createState() => _MessagesBottomSheetState();
}

class _MessagesBottomSheetState extends State<MessagesBottomSheet> {
  bool isLoading = true;
  List<Message> messages = [];

  @override
  void initState() {
    super.initState();
    _loadMessages();
  }

  Future<void> _loadMessages() async {
    await Future.delayed(Duration(seconds: 2)); // Simulate loading
    setState(() {
      messages = dummy_messages; // Assume this is your list of messages
      isLoading = false; // Stop loading
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildAppBar(context),
          isLoading ? _buildShimmerEffect() : _buildMessageList(),
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Text(
            "Football Fanatics",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              // Handle more options here
            },
          ),
        ],
      ),
    );
  }

  Widget _buildMessageList() {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.all(8.0),
        itemCount: messages.length,
        itemBuilder: (context, index) {
          final message = messages[index];
          return _buildMessageBubble(message);
        },
      ),
    );
  }

  Widget _buildMessageBubble(Message message) {
    final isCurrentUser = message.isCurrentUser;

    return Row(
      mainAxisAlignment:
          isCurrentUser ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        if (!isCurrentUser)
          CircleAvatar(
            backgroundImage: AssetImage(message.senderProfileImage),
          ),
        SizedBox(width: 6.0), // Space between avatar and message bubble
        Column(
          crossAxisAlignment:
              isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            SizedBox(
                height: 35.0), // Adjust this value to increase/decrease space
            BubbleSpecialOne(
              textStyle:
                  TextStyle(color: isCurrentUser ? Colors.white : Colors.black),
              text:
                  '${!isCurrentUser ? message.senderName : ''} ${!isCurrentUser ? '\n' : ''}${message.content}',
              color: isCurrentUser
                  ? (Colors.blueGrey[800] ?? Colors.blueGrey)
                  : (Colors.grey[300] ?? Colors.grey),
              isSender: isCurrentUser,
              tail: true, // Tail effect pointing to the sender
            ),
          ],
        ),
        if (isCurrentUser)
          SizedBox(width: 6.0), // Space between message bubble and avatar
        if (isCurrentUser)
          CircleAvatar(
            backgroundImage: AssetImage(message.senderProfileImage),
          ),
      ],
    );
  }

  Widget _buildMessageInput() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              // Handle add action
            },
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Type a message...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                filled: true,
                fillColor: Colors.grey[300],
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.camera_alt),
            onPressed: () {
              // Handle camera action
            },
          ),
          IconButton(
            icon: Icon(Icons.mic),
            onPressed: () {
              // Handle microphone action
            },
          ),
        ],
      ),
    );
  }

  Widget _buildShimmerEffect() {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.all(8.0),
        itemCount: 5, // Number of shimmer items
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 4.0),
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey[300],
                  ),
                  SizedBox(width: 8.0),
                  Expanded(
                    child: Container(
                      height: 16.0,
                      color: Colors.grey[300],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
