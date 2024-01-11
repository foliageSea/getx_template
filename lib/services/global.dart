import 'package:get/get.dart';

class GlobalService extends GetxService {
  Future loadData() async {}

  Future<GlobalService> init() async {
    await loadData();
    return this;
  }
}
