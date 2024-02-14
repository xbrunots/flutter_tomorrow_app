import '../core/core.dart';
import 'local_storage_service.dart';

class LocalStorageServiceImpl implements LocalStorageService {
  final LocalStorage _localStorage;

  LocalStorageServiceImpl({
    required LocalStorage localStorage,
  }) : _localStorage = localStorage;

  @override
  Future<void> insertStringKey(String key, String value, bool isSensitiveData) async {
    await _localStorage.setString(key, value);
  }

  @override
  Future<String?> getStringKey(String key, bool isSensitiveData) async {
    return await _localStorage.getString(key);
  }

  @override
  Future<void> setIntKey(String key, int value) async {
    await _localStorage.setInt(key, value);
  }

  @override
  Future<int?> getIntKey(String key) async {
    return _localStorage.getInt(key);
  }

  @override
  Future<void> setDoubleKey(String key, double value) async {
    _localStorage.setDouble(key, value);
  }

  @override
  Future<double?> getDoubleKey(String key) async {
    return _localStorage.getDouble(key);
  }

  @override
  Future<void> setBoolKey(String key, bool value) async {
    _localStorage.setBool(key, value);
  }

  @override
  Future<bool?> getBoolKey(String key) async {
    return _localStorage.getBool(key);
  }

  @override
  Future<void> removeKey(String key, bool isSensitiveData) async {
    await _localStorage.remove(key);
  }

  @override
  Future<void> cleanAll({bool? isSensitiveData}) async {
    _localStorage.clean();
  }

  @override
  Future<bool> containsKey(String key, bool isSensitiveData) async {
    return await _localStorage.contains(key);
  }
}
