import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemController extends GetxController {
  //TODO: Implement ItemController

  final count = 0.obs;
  final List<String> items = ['Name', 'Least', 'Most', 'Created'].obs;
  final selected = ''.obs;
  final String dropdownValue = "Name";
  var tabIndex = 0;

  void setSelected(String value) {
    selected.value = value;
  }

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
}
