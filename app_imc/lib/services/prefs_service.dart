import 'dart:convert';

import 'package:app_imc/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsService {
  static const String _key = "auth";

  static save(User user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(
        _key,
        jsonEncode({
          'user': user.toString(),
          'isAuth': true,
        }));
  }

  static Future<bool> isAuth() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var jsonResult = prefs.getString(_key);
    if (jsonResult != null) {
      var mapUser = jsonDecode(jsonResult);
      return mapUser['isAuth'];
    }
    return false;
  }

  static logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
  }
}
