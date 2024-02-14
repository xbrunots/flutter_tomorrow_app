import 'package:shared_preferences/shared_preferences.dart';

import 'local_storage.dart';

class LocalStorageImpl implements LocalStorage {
  Future<SharedPreferences> get _instance => SharedPreferences.getInstance();

  @override
  Future<void> clean() async {
    final sharedPreferences = await _instance;
    sharedPreferences.clear();
  }

  @override
  Future<bool> contains(String key) async {
    final sharedPreferences = await _instance;
    return sharedPreferences.containsKey(key);
  }

  @override
  Future<bool?> getBool(String key) async {
    final sharedPreferences = await _instance;
    return sharedPreferences.getBool(key);
  }

  @override
  Future<double?> getDouble(String key) async {
    final sharedPreferences = await _instance;
    return sharedPreferences.getDouble(key);
  }

  @override
  Future<int?> getInt(String key) async {
    final sharedPreferences = await _instance;
    return sharedPreferences.getInt(key);
  }

  @override
  Future<String?> getString(String key) async {
    final sharedPreferences = await _instance;
    return sharedPreferences.getString(key);
  }

  @override
  Future<void> remove(String key) async {
    final sharedPreferences = await _instance;
    sharedPreferences.remove(key);
  }

  @override
  Future<void> setBool(String key, bool value) async {
    final sharedPreferences = await _instance;
    sharedPreferences.setBool(key, value);
  }

  @override
  Future<void> setDouble(String key, double value) async {
    final sharedPreferences = await _instance;
    sharedPreferences.setDouble(key, value);
  }

  @override
  Future<void> setInt(String key, int value) async {
    final sharedPreferences = await _instance;
    sharedPreferences.setInt(key, value);
  }

  @override
  Future<void> setString(String key, String value) async {
    final sharedPreferences = await _instance;
    sharedPreferences.setString(key, value);
  }
}
