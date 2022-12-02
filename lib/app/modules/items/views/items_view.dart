import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../utils/widget/BottomNavbar.dart';
import '../controllers/item_controller.dart';

class ItemsView extends GetView<ItemController> {
  const ItemsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromRGBO(239, 242, 247, 1),
      bottomNavigationBar: BottomNavbar(),
      body: Center(
        child: Text(
          'Hello!, Welcome to F2V Inventory!',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
