import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_template/log/log.dart';
import 'package:getx_template/services/global.dart';

import 'package:tdesign_flutter/tdesign_flutter.dart';

import 'app/routes/app_pages.dart';
import 'data/data.dart';

Future<void> main() async {
  // Flutter 引擎初始化
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await initServices();
  runApp(const MainApp());
}

/// Services 初始化
Future<void> initServices() async {
  try {
    await initIsar();
    await Get.putAsync(() => GlobalService().init());
  } catch (e, st) {
    talker.error("initServices Error", e, st);
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1920, 1080),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        // 设置字体不跟随系统字体大小进行改变
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: "getx_template",
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
      },
    );
  }
}
