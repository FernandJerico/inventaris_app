import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bi.dart';
import 'package:iconify_flutter/icons/ep.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:iconify_flutter/icons/ph.dart';
import 'package:iconify_flutter/icons/ri.dart';

import '../../history/views/history_view.dart';
import '../../home/views/home_view.dart';
import '../../items/views/items_view.dart';
import '../../profile/views/profile_view.dart';
import '../controllers/bottom_navbar_controller.dart';

class BottomNavbarView extends GetView<BottomNavbarController> {
  const BottomNavbarView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavbarController>(builder: (controller) {
      return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: IndexedStack(
              index: controller.tabIndex,
              children: [
                HomeView(),
                ItemView(),
                HistoryView(),
                ProfileView(),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.black,
              backgroundColor: Colors.white,
              showSelectedLabels: true,
              showUnselectedLabels: false,
              currentIndex: controller.tabIndex,
              onTap: (index) {
                controller.changeTabIndex(index);
              },
              items: [
                BottomNavigationBarItem(
                    icon: Iconify(
                      Ph.house,
                      color: Colors.black,
                    ),
                    label: 'Home'),
                BottomNavigationBarItem(
                  icon: Iconify(
                    Ep.goods,
                    color: Colors.black,
                  ),
                  label: 'Items',
                ),
                BottomNavigationBarItem(
                  icon: Iconify(
                    Mdi.clipboard_text_history_outline,
                    color: Colors.black,
                  ),
                  label: 'History',
                ),
                BottomNavigationBarItem(
                  icon: Iconify(
                    Mdi.user_outline,
                    color: Colors.black,
                  ),
                  label: 'Profile',
                ),
              ]));
    });
  }
}
