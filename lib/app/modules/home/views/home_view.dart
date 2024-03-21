import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_template/log/log.dart';
import 'package:getx_template/utils/miru_directory.dart';
import 'package:talker_flutter/talker_flutter.dart';

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
        child: FilledButton(
            onPressed: () {
              log(MiruDirectory.getCacheDirectory);
              log(MiruDirectory.getDirectory);
            },
            child: const Text("测试")),
      ),
    );
  }
}
