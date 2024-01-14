import 'dart:io';

import 'package:get/get.dart';
import 'package:getx_template/app/interface/updater.dart';
import 'package:getx_template/app/interface/updater_android.dart';
import 'package:getx_template/app/interface/updater_windows.dart';

class UpdateService extends GetxService {
  late Updater updater;

  Future<UpdateService> init() async {
    updater = Platform.isAndroid ? UpdaterAndroid() : UpdaterWindows();
    return this;
  }
}
