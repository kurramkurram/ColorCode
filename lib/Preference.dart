import 'dart:async' show Future;
import 'package:shared_preferences/shared_preferences.dart';

class Preference {
  static Future<SharedPreferences> get _instance async =>
      _prefsInstance ??= await SharedPreferences.getInstance();
  static SharedPreferences _prefsInstance;

  static Future<SharedPreferences> init() async {
    _prefsInstance = await _instance;
    return _prefsInstance;
  }

  static int getColorCode(String key, [int defValue]) {
    return _prefsInstance.getInt(key) ?? defValue ?? "";
  }

  static Map getAllColorCode() {
    Map map = {};
    Set<String> keys = _prefsInstance.getKeys();
    keys.forEach((element) {
      map[element] = _prefsInstance.get(element);
    });
    return map;
  }

  static Future<bool> setColorCode(String key, int value) async {
    var prefs = await _instance;
    return prefs?.setInt(key, value) ?? Future.value(false);
  }

  static clearColorCode() async {
    _prefsInstance.clear();
  }
}
