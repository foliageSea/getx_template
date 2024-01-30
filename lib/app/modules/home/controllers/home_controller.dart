import 'dart:developer';

import 'package:get/get.dart';
import 'package:getx_template/data/models/user.dart';
import 'package:getx_template/main.dart';
import 'package:isar/isar.dart';

class HomeController extends GetxController {
  Future<void> addUser() async {
    final newUser = User()
      ..name = 'Jane Doe'
      ..age = 36;

    await isar.writeTxn(() async {
      var id = await isar.users.put(newUser);
      log("新增用户 $id");
    });
  }

  Future getAllUser() async {
    var list = await isar.users.where().findAll();
    log("$list");
  }
}
