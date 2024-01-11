import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_template/app/utils/log.dart';
import 'package:getx_template/services/global.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

import 'app/routes/app_pages.dart';

Future<void> main() async {
  await initServices();
  await GetStorage.init();
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: TDTheme.defaultData().brandClickColor,
        ),
      ),
    ),
  );
}

Future<void> initServices() async {
  try {
    await Get.putAsync(() => GlobalService().init());
  } catch (e, st) {
    debugPrintStack(stackTrace: st, label: "initServices Error");
  }
}
