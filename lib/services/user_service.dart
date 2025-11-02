import 'package:chat_ai_flutter_app/models/user_model.dart';
import 'package:flutter/widgets.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class UserService with ChangeNotifier {
  final SharedPreferencesAsync asyncPrefs = SharedPreferencesAsync();
  String? _uid = '';
  String? _name = '';

  String get name => _name!;

  String get uid => _uid!;

  Future<void> setUserData(String name) async {
    var uuid = Uuid();

    await asyncPrefs.setString('uid', uuid.v4());
    await asyncPrefs.setString('username', name);

    notifyListeners();
  }

  Future<void> removeUserData() async {
    await asyncPrefs.remove('uid');
    await asyncPrefs.remove('username');
  }

  Future<UserModel> getUserData() async {
    var userData = await asyncPrefs.getAll();
    var userJSON = UserModel.fromJson(userData);

    _name = userJSON.username;
    _uid = userJSON.uid;

    return userJSON;
  }
}
