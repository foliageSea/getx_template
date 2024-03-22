import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_template/log/log.dart';
import 'package:getx_template/services/global.dart';
import 'package:talker_flutter/talker_flutter.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var c = Get.find<GlobalService>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => TalkerScreen(talker: talker),
              ));
            },
            icon: const Icon(Icons.bug_report),
          )
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Obx(() => Text(c.globalConfig.toString())),
            const SizedBox(
              height: 8,
            ),
            FilledButton(
              onPressed: () {
                c.globalConfig.value.version = '1.0.1';
                c.globalConfig.refresh();
              },
              child: const Text('修改'),
            ),
          ],
        ),
      ),
    );
  }
}
