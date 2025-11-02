import 'package:chat_ai_flutter_app/models/chat_model.dart';
import 'package:chat_ai_flutter_app/models/user_model.dart';
import 'package:chat_ai_flutter_app/services/chat_service.dart';
import 'package:chat_ai_flutter_app/services/user_service.dart';
import 'package:chat_ai_flutter_app/shared/widgets/chat_message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class ChatPage extends StatefulWidget {
  final String agent;
  final String agentName;

  const ChatPage({super.key, required this.agent, required this.agentName});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late String agent;
  late String agentName;
  final UserService userServiceData = UserService();
  final db = FirebaseFirestore.instance;
  final dateNow = Timestamp.now();
  final ScrollController _scrollController = ScrollController();
  final chatService = ChatService();
  var messageTextController = TextEditingController();
  var isBotSending = false;

  UserModel userData = UserModel();

  void handleSendUserMessage() async {
    var dbCollectionRef = db.collection('chats').doc('types').collection(agent);
    try {
      var text = '';

      text = messageTextController.text;
      var userDataMessage = {
        "uid": userData.uid,
        "created_at": Timestamp.now(),
        "message": text,
        "isBot": false,
        "type": agent,
      };

      await dbCollectionRef.add(userDataMessage);
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
      messageTextController.text = '';

      setState(() {
        isBotSending = true;
      });

      var response = await chatService.sendMessage(agent, text);

      var botResponseData = {
        "uid": userData.uid,
        "created_at": Timestamp.now(),
        "message": response,
        "isBot": true,
        "type": agent,
      };

      await dbCollectionRef.add(botResponseData);

      _scrollController.animateTo(
        _scrollController.offset + 20,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );

      setState(() {
        isBotSending = false;
      });
    } catch (error) {
      FirebaseCrashlytics.instance.log(error.toString());
    }
  }

  void _scrollToEnd() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  void initState() {
    Future.microtask(() {
      context.read<UserService>().getUserData();
    });
    agent = widget.agent;
    agentName = widget.agentName;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 500), _scrollToEnd);
    });

    super.initState();
  }

  void clearChat() async {
    var dbCollectionRef = db
        .collection('chats')
        .doc('types')
        .collection(agent)
        .where('uid', isEqualTo: userData.id);
    try {
      var snapshots = await dbCollectionRef.get();

      for (var doc in snapshots.docs) {
        await doc.reference.delete();
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Novo chat iniciado com o $agentName')),
      );
    } catch (error) {
      FirebaseCrashlytics.instance.log(error.toString());
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Ocorreu um erro ao iniciar novo chat! Tente novamente mais tarde!',
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final userService = context.watch<UserService>();
    userData.id = userService.uid.toString();
    userData.name = userService.name;

    return FutureBuilder(
      future: userService.getUserData(),
      builder: (context, asyncSnapshot) {
        if (!asyncSnapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        final user = asyncSnapshot.data!;
        return Scaffold(
          appBar: AppBar(
            title: Text("Chat"),
            backgroundColor: Colors.deepOrangeAccent,
            actions: [
              IconButton(
                onPressed: () {
                  clearChat();
                },
                icon: Icon(Icons.edit_square),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Expanded(
                  child: StreamBuilder<QuerySnapshot>(
                    stream: db
                        .collection('chats')
                        .doc('types')
                        .collection(agent)
                        .where('uid', isEqualTo: user.uid)
                        .orderBy('created_at', descending: false)
                        .snapshots(),
                    builder: (context, asyncSnapshot) {
                      if (isBotSending) {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          if (_scrollController.hasClients) {
                            _scrollController.animateTo(
                              _scrollController.position.maxScrollExtent,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeOut,
                            );
                          }
                        });
                      }

                      if (asyncSnapshot.hasError) {
                        FirebaseCrashlytics.instance.log(
                          asyncSnapshot.error.toString(),
                        );
                        return Text(
                          "Ocorreu um erro, tente novamente mais tarde!",
                        );
                      }

                      if (!asyncSnapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            height: 24,
                            width: 24,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.deepOrangeAccent,
                            ),
                          ),
                        );
                      }

                      if (asyncSnapshot.data!.docs.isEmpty) {
                        return Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Text(
                            'Inicie o chat com o $agentName, mande sua dúvida pra ele!',
                            style: TextStyle(color: Colors.deepOrangeAccent),
                            textAlign: TextAlign.center,
                          ),
                        );
                      }

                      return ListView(
                        controller: _scrollController,
                        children: [
                          ...asyncSnapshot.data!.docs.map((item) {
                            var data = ChatModel.fromJson(
                              item.data() as Map<String, dynamic>,
                            );

                            return ChatMessage(
                              chatData: data,
                              username: user.name,
                              agentName: agentName,
                              agentId: agent,
                            );
                          }),

                          if (isBotSending)
                            ChatMessage(
                              chatData: ChatModel.fromJson({
                                "uid": "",
                                "isBot": true,
                                "message": "",
                                "created_at": Timestamp.now(),
                                "type": agent,
                              }),
                              username: user.name,
                              agentName: agentName,
                              agentId: agent,
                              isBotSending: true,
                            )
                          else
                            const SizedBox.shrink(),
                        ],
                      );
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 32, horizontal: 2),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: messageTextController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.deepOrangeAccent,
                                width: 2.0,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.deepOrangeAccent,
                                width: 3.0,
                              ), // Focused border color and width
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            focusColor: Colors.deepOrangeAccent,
                            labelText: 'Digite sua mensagem',
                            labelStyle: TextStyle(
                              color: Colors.deepOrangeAccent,
                            ),
                          ),
                        ),
                      ),
                      isBotSending
                          ? Container(
                              margin: EdgeInsets.only(left: 8),
                              child: SpinKitCircle(
                                size: 32,
                                color: Colors.deepOrangeAccent,
                              ),
                            )
                          : IconButton(
                              onPressed: () {
                                handleSendUserMessage();
                              },
                              icon: Icon(Icons.send_rounded),
                              color: Colors.deepOrangeAccent,
                            ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
