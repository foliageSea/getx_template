import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_template/app/utils/log.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton(
              onPressed: () {
                // TDToast.showText("测试", context: context);

                controller.addUser();
              },
              child: const Text("新增"),
            ),
            const SizedBox(
              height: 8,
            ),
            FilledButton(
              onPressed: () {
                // TDToast.showText("测试", context: context);

                controller.getAllUser();
              },
              child: const Text("读取"),
            ),
            const SizedBox(
              height: 8,
            ),
            FilledButton(
              onPressed: () {
                // TDToast.showText("测试", context: context);

                controller.fetch();
              },
              child: const Text("请求接口"),
            ),
          ],
        ),
      ),
    );
  }
}
