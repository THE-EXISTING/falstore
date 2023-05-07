import 'package:falstore/falstore.dart';
import 'package:faltool/faltool.dart';

/// Singleton
class SecureStorageX {
  static const emptyData = '';
  final FlutterSecureStorage _storage;
  static const SecureStorageX instance = SecureStorageX._singleton();

  const SecureStorageX._singleton(
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
