import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalStorage {
  Future<String?> getStringData(String key);
  Future<bool> saveStringData(String key, String value);
  Future<bool> saveBoolData(String key, bool value);
  Future<bool?> getBoolData(String key);
}

class LocalStorageImpl implements LocalStorage {
  @override
  Future<bool> saveStringData(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(key, value);
  }

  @override
  Future<bool> saveBoolData(String key, bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setBool(key, value);
  }

  @override
  Future<String?> getStringData(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  @override
  Future<bool?> getBoolData(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key);
  }
}
