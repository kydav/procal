import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'local_storage_service.g.dart';

@riverpod
class LocalStorageService extends _$LocalStorageService {
  @override
  void build() {}
  void initialize(SharedPreferences prefs) {
    _sharedPreferences = prefs;
  }

  late final SharedPreferences _sharedPreferences;

  void storeInt(String key, int value) => _sharedPreferences.setInt(key, value);

  bool checkExists(String key) => _sharedPreferences.containsKey(key);

  int? getInt(String key) => _sharedPreferences.getInt(key);

  void setBool({required String key, required bool value}) {
    _sharedPreferences.setBool(key, value);
  }

  bool? getBool(String key) => _sharedPreferences.getBool(key);
}
