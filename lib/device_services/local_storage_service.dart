import 'package:localstorage/localstorage.dart';

class LocalStorageService {
  LocalStorageService();

  void storeValue(String key, String value) => localStorage.setItem(key, value);

  bool checkValueExists(String key) {
    final value = localStorage.getItem(key);
    return value != null;
  }

  String? getValue(String key) => localStorage.getItem(key);
}
