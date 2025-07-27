import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  LocalStorageService();
  late final SharedPreferences sharedPreferences;

  void storeInt(String key, int value) => sharedPreferences.setInt(key, value);

  bool checkExists(String key) => sharedPreferences.containsKey(key);

  int? getInt(String key) => sharedPreferences.getInt(key);

  void setBool({required String key, required bool value}) {
    sharedPreferences.setBool(key, value);
  }

  bool? getBool(String key) => sharedPreferences.getBool(key);
}
