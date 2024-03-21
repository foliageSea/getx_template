import 'package:hive_flutter/adapters.dart';
import 'package:isar/isar.dart';

import 'miru_directory.dart';

class MiruStorage {
  static late final Isar database;
  static late final Box settings;
  static late String _path;

  static ensureInitialized() async {
    _path = MiruDirectory.getDirectory;
    // 初始化设置
    await Hive.initFlutter(_path);
    settings = await Hive.openBox("settings");
    await _initSettings();

    // 初始化数据库
    database = await Isar.open(
      [],
      directory: _path,
    );
  }

  static _initSettings() async {
    await _initSetting(SettingKey.miruRepoUrl, "https://miru-repo.0n0.dev");
    await _initSetting(SettingKey.saveLog, true);
  }

  static _initSetting(String key, dynamic value) async {
    if (!settings.containsKey(key)) {
      await settings.put(key, value);
    }
  }

  static setSetting(String key, dynamic value) async {
    await settings.put(key, value);
  }

  static getSetting(String key) {
    return settings.get(key);
  }
}

class SettingKey {
  static const miruRepoUrl = "MiruRepoUrl";
  static const saveLog = "SaveLog";
}
