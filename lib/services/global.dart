import 'package:get/get.dart';
import 'package:getx_template/app/config/config.dart';
import 'package:getx_template/app/constants/storage_key.dart';
import 'package:getx_template/app/utils/local_storage.dart';
import 'package:getx_template/app/utils/log.dart';

class GlobalService extends GetxService {
  Rx<GlobalConfig> globalConfig = GlobalConfig().obs;

  /// 初始化全局配置
  Future initGlobalConfig() async {
    try {
      var result =
          LocalStorage.read<Map<String, dynamic>>(StorageKey.globalConfig);
      if (result != null) {
        var config = GlobalConfig.fromJson(result);
        globalConfig.value = config;
      } else {
        var config = GlobalConfig(
          version: '1.0.0',
          themeColor: '#fff',
          darkMode: false,
        );
        globalConfig.value = config;
        LocalStorage.write(StorageKey.globalConfig, config.toJson());
      }
      globalConfig.refresh();
    } catch (e, st) {
      talker.error("initGlobalConfig Error", e, st);
    }
  }

  /// 更新全局配置
  Future updateGlobalConfig() async {
    LocalStorage.write(StorageKey.globalConfig, globalConfig.value.toJson());
  }

  Future initGlobalService() async {
    try {
      await initGlobalConfig();
    } catch (e, st) {
      talker.error("initGlobalService Error", e, st);
    }
  }

  Future<GlobalService> init() async {
    try {
      await initGlobalService();
    } catch (e, st) {
      talker.error("initGlobalService Error", e, st);
    }

    return this;
  }
}
