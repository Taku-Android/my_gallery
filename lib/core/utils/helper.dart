import 'package:shared_preferences/shared_preferences.dart';

class Helper {




  // Write Token DATA
  static Future<void> saveToken(String token ) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);

  }

  // Read Token Data
  static Future getToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString('token');
  }

}
