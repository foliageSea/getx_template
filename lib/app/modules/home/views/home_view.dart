import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_template/app/models/user.dart';
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
        child: TDButton(
          onTap: () {
            // TDToast.showText('轻提示文字内容', context: context);
            try {
              // your code...
              throw Exception("测试");
            } catch (e, st) {
              talker.handle(e, st, 'Exception with');
            }

            // talker.info('App is started');
            // talker.critical('❌ Houston, we have a problem!');
            // talker.error('🚨 The service is not available');
          },
          text: '测试',
          size: TDButtonSize.large,
          type: TDButtonType.fill,
          shape: TDButtonShape.rectangle,
          theme: TDButtonTheme.primary,
        ),
      ),
    );
  }
}
