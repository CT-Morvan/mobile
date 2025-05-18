import 'dart:convert';

import 'package:ct_morvan_app/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesController {
  Future<bool> saveLoggedUser(UserModel user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return await prefs.setString('user', jsonEncode(user.toJson()));
  }

  Future<UserModel?> getLoggedUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userPref = prefs.getString('user');

    if (userPref == null) {
      return null;
    }

    Map<String, dynamic> userMap = jsonDecode(userPref) as Map<String, dynamic>;

    return UserModel.fromJson(userMap);
  }

  Future<bool> deleteUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString('user', "");
  }
}
