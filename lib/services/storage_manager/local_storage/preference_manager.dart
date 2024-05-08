abstract class PreferenceManager {
  String getString(String key, {String defaultValue = ""});

  Future<bool> setString(String key, String value);

  int getInt(String key, {int defaultValue = 0});

  Future<bool> setInt(String key, int value);

  double getDouble(String key, {double defaultValue = 0.0});

  Future<bool> setDouble(String key, double value);

  bool getBool(String key, {bool defaultValue = false});

  Future<bool> setBool(String key, bool value);

  List<String> getStringList(String key,
      {List<String> defaultValue = const []});

  Future<bool> setStringList(String key, List<String> value);

  Future<bool> remove(String key);

  Future<bool> clearAll();
}
