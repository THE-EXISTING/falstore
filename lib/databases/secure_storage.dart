import 'package:falstore/lib.dart';

/// Singleton
class SecureStorage {
  static const emptyData = '';
  final FlutterSecureStorage _storage;
  static const SecureStorage instance = SecureStorage._singleton();

  const SecureStorage._singleton(
      {FlutterSecureStorage storage = const FlutterSecureStorage()})
      : _storage = storage;

  Future<void> deleteAll() async {
    await _storage.deleteAll();
  }

  Future<void> save({required String key, required String data}) {
    return _storage.write(key: key, value: data).then((value) {
      Log.v('Success save key: $key, data: $data to SecureStorage.');
      return value;
    });
  }

  Future<String> load({required String key, String? defaultData}) {
    return _storage.read(key: key).then((data) {
      Log.v('Success load key: $key, data: $data from SecureStorage.');
      return data ?? defaultData ?? emptyData;
    });
  }

  Future<void> delete({required String key}) {
    return _storage.delete(key: key).then((value) {
      Log.v('Success delete key: $key from SecureStorage.');
      return value;
    });
  }
}
