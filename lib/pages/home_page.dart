import 'package:chat_ai_flutter_app/pages/chat_page.dart';
import 'package:chat_ai_flutter_app/pages/register_user_page.dart';
import 'package:chat_ai_flutter_app/services/user_service.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  var userService = UserService();

  void registerAnalyticsClickAssistant(String assistant) {
    analytics.logEvent(
      name: "chosen_assistant",
      parameters: {"assistant_name": assistant},
    );
  }

  void logout() {
    userService.removeUserData();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => RegisterUserPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final userService = context.watch<UserService>();

    return Scaffold(
      appBar: AppBar(
        title: Text("Assistente IA", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: FutureBuilder(
        future: userService.getUserData(),
        builder: (context, asyncSnapshot) {
          if (!asyncSnapshot.hasData) return const CircularProgressIndicator();

          final user = asyncSnapshot.data!;
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      "Olá, bem-vindo ${user.username}",
                      style: TextStyle(fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 24),
                    Center(
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Escolha seu assistente para o assunto que você precisa",
                              style: TextStyle(fontSize: 18),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                    InkWell(
                      onTap: () => {
                        registerAnalyticsClickAssistant('sports'),
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChatPage(
                              agent: 'sports',
                              agentName: '⚽️ Assistente de esportes',
                            ),
                          ),
                        ),
                      },
                      child: Container(
                        height: 60,
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.blueGrey,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("⚽️"),
                            Text("Assistente de esportes"),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    InkWell(
                      onTap: () => {
                        registerAnalyticsClickAssistant('trips'),
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChatPage(
                              agent: 'trips',
                              agentName: '✈️ Assistente de viagens',
                            ),
                          ),
                        ),
                      },
                      child: Container(
                        height: 60,
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.blueGrey,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Text("✈️"), Text("Assistente de viagens")],
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    InkWell(
                      onTap: () => {
                        registerAnalyticsClickAssistant('health'),
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChatPage(
                              agent: 'health',
                              agentName: '💪 Assistente de saúde',
                            ),
                          ),
                        ),
                      },
                      child: Container(
                        height: 60,
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.blueGrey,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Text("💪"), Text("Assistente de saúde")],
                        ),
                      ),
                    ),
                  ],
                ),

                InkWell(
                  onTap: () => {logout()},
                  child: Container(
                    height: 60,
                    padding: EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.logout, color: Colors.redAccent),
                        Container(
                          margin: EdgeInsets.only(left: 4),
                          child: Text(
                            "Sair",
                            style: TextStyle(color: Colors.redAccent),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
