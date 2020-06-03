import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  static getValue(String key) async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    var value = shared.getString(key);
    return value;
  }

  static setValue(String value, String key) async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    // var value = values.toString();
    shared.setString(key, value);
  }

  static deleteValue(String key) async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    shared.remove(key);
  }

  static deleteAll() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    shared.clear();
  }
}
