import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../utils/widget/BottomNavbar.dart';
import '../controllers/history_controller.dart';

class HistoryView extends GetView<HistoryController> {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(239, 242, 247, 1),
      bottomNavigationBar: const BottomNavbar(),
      appBar: AppBar(
        title: const Text('HistoryView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'HistoryView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
