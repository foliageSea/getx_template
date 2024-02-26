import 'dart:developer';

import 'package:getx_template/log/log.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'models/user.dart';

late Isar isar;

/// 初始化 Isar
Future initIsar() async {
  try {
    final dir = await getApplicationDocumentsDirectory();
    log("Isar $dir");
    isar = await Isar.open(
      [UserSchema],
      directory: dir.path,
      name: 'getx_template_db',
    );
  } catch (e, st) {
    talker.error("initIsar Error", e, st);
  }
}
