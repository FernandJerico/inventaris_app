import 'package:get/get.dart';

class HistoryController extends GetxController {
  //TODO: Implement HistoryController

  final count = 0.obs;

  var tabIndex = 0;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }
}
