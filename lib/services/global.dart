import 'package:get/get.dart';
import 'package:getx_template/app/config/config.dart';
import 'package:getx_template/app/config/default_global_config.dart';
import 'package:getx_template/app/constants/storage_key.dart';
import 'package:getx_template/app/utils/local_storage.dart';
import 'package:getx_template/log/log.dart';

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
        globalConfig.value = defaultGlobalConfig;
        LocalStorage.write(
            StorageKey.globalConfig, defaultGlobalConfig.toJson());
      }
      globalConfig.refresh();
    } catch (e, st) {
      talker.error("[GlobalService] init GlobalConfig Error", e, st);
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
      talker.error("[GlobalService] ini tGlobalService Error", e, st);
    }
  }

  Future<GlobalService> init() async {
    await initGlobalService();
    return this;
  }
}
