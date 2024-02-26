import 'package:get/get.dart';
import 'package:getx_template/log/log.dart';
import 'package:talker_flutter/talker_flutter.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => TalkerWrapper(
        talker: talker,
        options: const TalkerWrapperOptions(
          enableErrorAlerts: true,
        ),
        child: const HomeView(),
      ),
      binding: HomeBinding(),
    ),
  ];
}
