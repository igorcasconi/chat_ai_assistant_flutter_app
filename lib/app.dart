import 'package:chat_ai_flutter_app/models/user_model.dart';
import 'package:chat_ai_flutter_app/pages/home_page.dart';
import 'package:chat_ai_flutter_app/pages/register_user_page.dart';
import 'package:chat_ai_flutter_app/services/user_service.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final UserService userServiceData = UserService();
  final FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  UserModel userData = UserModel();

  @override
  void initState() {
    Future.microtask(() {
      context.read<UserService>().getUserData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userService = context.watch<UserService>();

    return FutureBuilder(
      future: userService.getUserData(),
      builder: (context, asyncSnapshot) {
        if (!asyncSnapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        final user = asyncSnapshot.data!;
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorObservers: [FirebaseAnalyticsObserver(analytics: analytics)],
          theme: ThemeData.dark(),
          home: user.uid != null ? HomePage() : RegisterUserPage(),
        );
      },
    );
  }
}
