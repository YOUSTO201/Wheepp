import 'package:chatapp/components/constns.dart';

class Message {
  final String message;
  final String? id;
  final dynamic createdAt;
  Message(this.message, this.id, this.createdAt);

  factory Message.fromJson(jsonData) {
    return Message(jsonData[kMessage], jsonData['id'], jsonData['createdAt']);
  }
}
