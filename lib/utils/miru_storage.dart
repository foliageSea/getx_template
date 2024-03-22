import 'dart:convert';

import 'package:getx_template/app/config/default_global_config.dart';
import 'package:getx_template/data/models/user.dart';
import 'package:getx_template/log/log.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:isar/isar.dart';

import 'miru_directory.dart';

class MiruStorage {
  static late final Isar database;
  static late final Box box;
  static late String _path;

  static Future ensureInitialized() async {
    _path = MiruDirectory.getDirectory;
    talker.info('📦配置文件路径: $_path');
    // 初始化设置
    await Hive.initFlutter(_path);
    box = await Hive.openBox("configs");
    await _initSettings();

    // 初始化数据库
    database = await Isar.open(
      [
        UserSchema,
      ],
      directory: _path,
    );
  }

  static _initSettings() async {
    await _initSetting(
        StorageKey.globalConfig, jsonEncode(defaultGlobalConfig.toJson()));
    await _initSetting(StorageKey.saveLog, true);
  }

  static _initSetting(String key, dynamic value) async {
    if (!box.containsKey(key)) {
      await box.put(key, value);
    }
  }

  static set(String key, dynamic value) async {
    await box.put(key, value);
  }

  static get(String key) {
    return box.get(key);
  }
}

class StorageKey {
  static const globalConfig = "globalConfig";
  static const saveLog = "SaveLog";
}
