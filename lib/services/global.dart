import 'dart:convert';

import 'package:get/get.dart';
import 'package:getx_template/app/config/config.dart';
import 'package:getx_template/log/log.dart';
import 'package:getx_template/utils/miru_storage.dart';

class GlobalService extends GetxService {
  Rx<GlobalConfig> globalConfig = GlobalConfig().obs;

  void _initConfig() {
    try {
      var json = jsonDecode(MiruStorage.get(StorageKey.globalConfig) as String)
          as Map<String, dynamic>;
      globalConfig.value = GlobalConfig.fromJson(json);
    } catch (e, st) {
      talker.handle(e, st, '初始化全局配置失败');
    }
    ever(
      globalConfig,
      (callback) => MiruStorage.set(
        StorageKey.globalConfig,
        jsonEncode(
          globalConfig.value.toJson(),
        ),
      ),
    );
  }

  Future<GlobalService> init() async {
    _initConfig();
    return this;
  }
}
