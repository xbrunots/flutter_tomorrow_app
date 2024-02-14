abstract class LocalStorageService {
  Future<void> insertStringKey(String key, String value, bool isSensitiveData);
  Future<String?> getStringKey(String key, bool isSensitiveData);
  Future<void> setIntKey(String key, int value);
  Future<int?> getIntKey(String key);
  Future<void> setDoubleKey(String key, double value);
  Future<double?> getDoubleKey(String key);
  Future<void> setBoolKey(String key, bool value);
  Future<bool?> getBoolKey(String key);
  Future<void> removeKey(String key, bool isSensitiveData);
  Future<void> cleanAll({bool? isSensitiveData});
  Future<bool> containsKey(String key, bool isSensitiveData);
}
