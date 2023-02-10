import 'package:get/get.dart';

import '../controllers/testis_controller.dart';

class TestisBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TestisController>(
      () => TestisController(),
    );
  }
}
