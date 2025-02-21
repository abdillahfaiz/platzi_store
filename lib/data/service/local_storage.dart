import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {

  //Method for save token from response login
  Future<void> saveToken(String token) async {
    final SharedPreferences db = await SharedPreferences.getInstance();
    await db.setString('token_acces', token);
  }

  //Method for get token
  Future<String?> getToken() async {
    final SharedPreferences db = await SharedPreferences.getInstance();
    final String? token = await db.getString('token_acces');
    return token;
  }

  //Method for delete token when user is logout
  Future<void> deleteToken() async {
    final SharedPreferences db = await SharedPreferences.getInstance();
    await db.remove('token_acces');
  }
}
