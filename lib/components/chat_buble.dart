import 'package:chatapp/components/app_colors.dart';
import 'package:chatapp/models/message.dart';
import 'package:flutter/material.dart';

class ChatBuble extends StatelessWidget {
  const ChatBuble({Key? key, required this.message}) : super(key: key);

  final Message message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.only(left: 16, top: 11, bottom: 11, right: 16),
        margin: EdgeInsets.only(left: 16, bottom: 7,),
        decoration: BoxDecoration(
          color: messageFriend,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(14),
            bottomRight: Radius.circular(14),
            topLeft: Radius.circular(17.5),
          ),
        ),
        child: Text(
          message.message,
          style: TextStyle(
            color: messagecolor,
            fontSize: 16.5,
          ),
        ),
      ),
    );
  }
}

class ChatBubleForFriend extends StatelessWidget {
  const ChatBubleForFriend({Key? key, required this.message}) : super(key: key);

  final Message message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: EdgeInsets.only(left: 16, top: 11, bottom: 11, right: 16),
        margin: EdgeInsets.only(right: 16, bottom: 7),
        decoration: BoxDecoration(
          color: darkgreen,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(17.5),
            topLeft: Radius.circular(12),
            bottomLeft: Radius.circular(12),
          ),
        ),
        child: Text(
          message.message,
          style: TextStyle(
            color: messagecolor,
            fontSize: 16.5,
          ),
        ),
      ),
    );
  }
}