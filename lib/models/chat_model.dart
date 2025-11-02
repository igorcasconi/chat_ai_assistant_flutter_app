import 'package:cloud_firestore/cloud_firestore.dart';

class ChatModel {
  String? message;
  String? uid;
  bool? isBot;
  Timestamp? createdAt;
  String? type;

  ChatModel({this.message, this.uid, this.isBot, this.createdAt, this.type});

  ChatModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    uid = json['uid'];
    isBot = json['isBot'];
    createdAt = json['created_at'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['uid'] = uid;
    data['isBot'] = isBot;
    data['created_at'] = createdAt;
    data['type'] = type;
    return data;
  }
}
