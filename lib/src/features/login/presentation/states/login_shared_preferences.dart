import 'package:shared_preferences/shared_preferences.dart';

class LoginSharedPreferences {
  static const String _tokenKey = "TOKEN_KEY";
  static const String _userIdKey = "USER_ID_KEY";
  static const String _codeKey = "CODE_KEY";

  static Future<void> setToken(String token) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString(_tokenKey, token);
  }

  static Future<String?> getToken() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getString(_tokenKey);
  }

  static Future<void> setUserId(int userId) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setInt(_userIdKey, userId);
  }

  static Future<int?> getUserId() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getInt(_userIdKey);
  }

  static Future<void> setCode(String code) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString(_codeKey, code);
  }

  static Future<String?> getCode() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getString(_codeKey);
  }

  static Future<void> clear() async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }
}
