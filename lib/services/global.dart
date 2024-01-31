import 'dart:developer';

import 'package:get/get.dart';
import 'package:getx_template/app/utils/log.dart';

class GlobalService extends GetxService {
  Future initGlobalService() async {}

  Future<GlobalService> init() async {
    try {
      await initGlobalService();
    } catch (e, st) {
      talker.error("initGlobalService Error", e, st);
    }

    return this;
  }
}
