import 'platform_init.dart';

/// Platform 初始化安卓实现类
class PlatformInitAndroid implements PlatformInit {
  @override
  Future init() async {
    print("PlatformInitAndroid.init");
  }
}
