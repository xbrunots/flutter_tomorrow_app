abstract class LocalStorage {
  Future<String?> getString(String key);
  Future<void> setString(String key, String value);

  Future<int?> getInt(String key);
  Future<void> setInt(String key, int value);

  Future<double?> getDouble(String key);
  Future<void> setDouble(String key, double value);

  Future<bool?> getBool(String key);
  Future<void> setBool(String key, bool value);

  Future<void> remove(String key);
  Future<void> clean();
  Future<bool> contains(String key);
}
