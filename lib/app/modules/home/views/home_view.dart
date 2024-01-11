import 'package:flutter/material.dart';

import 'package:get/get.dart';
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
      ),
      body: Center(
        child: TDButton(
          onTap: () {
            TDToast.showText('轻提示文字内容', context: context);
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
