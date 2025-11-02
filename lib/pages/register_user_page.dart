import 'package:chat_ai_flutter_app/pages/home_page.dart';
import 'package:chat_ai_flutter_app/services/user_service.dart';
import 'package:flutter/material.dart';

class RegisterUserPage extends StatefulWidget {
  const RegisterUserPage({super.key});

  @override
  State<RegisterUserPage> createState() => _RegisterUserPageState();
}

class _RegisterUserPageState extends State<RegisterUserPage> {
  var nameTextController = TextEditingController();
  var userService = UserService();

  @override
  Widget build(BuildContext context) {
    handleSubmitName() async {
      if (nameTextController.text.isEmpty || nameTextController.text == '') {
        return;
      }

      await userService.setUserData(nameTextController.text);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Assistente IA", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 80.0, horizontal: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              "Vamos começar, o nosso primeiro passo é saber como você chama!",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            Text("Digite seu nome:"),
            SizedBox(height: 24),
            TextField(
              controller: nameTextController,
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
                labelText: 'Seu nome',
                labelStyle: TextStyle(color: Colors.deepOrangeAccent),
              ),
            ),
            SizedBox(height: 24),
            FilledButton(
              onPressed: () {
                handleSubmitName();
              },
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(
                  Colors.deepOrangeAccent,
                ),
              ),
              child: const Text(
                'Continuar',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
