import 'package:shared_preferences/shared_preferences.dart';

class SharedValues {
  static SharedPreferences? _sharedPreferences;

  static SharedPreferences? get sharedPreferences => _sharedPreferences;

  static Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }
}
