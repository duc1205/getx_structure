import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'preference_manager.dart';

@LazySingleton(as: PreferenceManager)
class PreferenceManagerImpl implements PreferenceManager {
  final SharedPreferences preferences;

  PreferenceManagerImpl({required this.preferences});

  @override
  String getString(String key, {String defaultValue = ""}) {
    return preferences.getString(key) ?? defaultValue;
  }

  @override
  Future<bool> setString(String key, String value) async {
    try {
      return preferences.setString(key, value);
    } catch (_) {
      return false;
    }
  }

  @override
  int getInt(String key, {int defaultValue = 0}) {
    return preferences.getInt(key) ?? defaultValue;
  }

  @override
  Future<bool> setInt(String key, int value) {
    return preferences.setInt(key, value);
  }

  @override
  double getDouble(String key, {double defaultValue = 0.0}) {
    return preferences.getDouble(key) ?? defaultValue;
  }

  @override
  Future<bool> setDouble(String key, double value) {
    return preferences.setDouble(key, value);
  }

  @override
  bool getBool(String key, {bool defaultValue = false}) {
    return preferences.getBool(key) ?? defaultValue;
  }

  @override
  Future<bool> setBool(String key, bool value) {
    return preferences.setBool(key, value);
  }

  @override
  List<String> getStringList(String key, {List<String> defaultValue = const []}) {
    return preferences.getStringList(key) ?? defaultValue;
  }

  @override
  Future<bool> setStringList(String key, List<String> value) {
    return preferences.setStringList(key, value);
  }

  @override
  Future<bool> remove(String key) {
    return preferences.remove(key);
  }

  @override
  Future<bool> clearAll() => preferences.clear();
}
