import 'package:chat_ai_flutter_app/models/chat_model.dart';
import 'package:flutter/material.dart';
import 'package:markdown_widget/config/all.dart';
import 'package:markdown_widget/widget/markdown.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ChatMessage extends StatelessWidget {
  final ChatModel chatData;
  final String username;
  final String agentName;
  final String agentId;
  final bool? isBotSending;

  const ChatMessage({
    super.key,
    required this.chatData,
    required this.agentName,
    required this.agentId,
    required this.username,
    this.isBotSending,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 14),
      alignment: chatData.isBot! ? Alignment.centerLeft : Alignment.centerRight,
      child: Column(
        crossAxisAlignment: chatData.isBot!
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.end,
        children: [
          Container(
            margin: chatData.isBot!
                ? EdgeInsets.only(left: 10)
                : EdgeInsets.only(right: 10),
            child: Text(
              chatData.isBot! ? agentName : username,
              textAlign: TextAlign.end,
            ),
          ),
          SizedBox(height: 4),
          Container(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: BoxDecoration(
              color: chatData.isBot! ? Colors.black87 : Colors.deepOrangeAccent,
              borderRadius: BorderRadius.circular(16),
            ),
            child: isBotSending != null && isBotSending!
                ? Container(
                    margin: EdgeInsets.symmetric(vertical: 16),
                    child: SpinKitThreeBounce(
                      color: Colors.deepOrangeAccent,
                      size: 16,
                    ),
                  )
                : chatData.isBot!
                ? MarkdownWidget(
                    data: chatData.message!,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    config: MarkdownConfig.defaultConfig,
                  )
                : Text(chatData.message!),
          ),
        ],
      ),
    );
  }
}
