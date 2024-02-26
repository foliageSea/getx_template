import 'package:get_storage/get_storage.dart';

final _box = GetStorage();

class LocalStorage {
  static Future<void> write(String key, dynamic value) async {
    return _box.write(key, value);
  }

  static T? read<T>(String key) {
    return _box.read<T>(key);
  }
}
