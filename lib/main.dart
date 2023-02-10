import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:inventaris_app/app/modules/BottomNavbar/controllers/bottom_navbar_controller.dart';
import 'package:inventaris_app/app/modules/add_items/controllers/add_items_controller.dart';
import 'package:inventaris_app/app/modules/history/views/history_view.dart';
import 'package:inventaris_app/app/modules/home/controllers/home_controller.dart';
import 'package:inventaris_app/app/modules/items/controllers/item_controller.dart';
import 'package:inventaris_app/app/routes/app_pages.dart';
import 'package:inventaris_app/firebase_options.dart';

import 'app/modules/auth/controllers/auth_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Get.put(ItemController(), permanent: true);
  Get.put(AddItemsController(), permanent: true);
  Get.put(AuthController(), permanent: true);
  Get.put(HistoryView(), permanent: true);
  Get.put(BottomNavbarController(), permanent: true);
  Get.put(HomeController(), permanent: true);
  Get.lazyPut(() => AuthController());

  // Get.lazyPut(() => AuthController());
  runApp(StreamBuilder<User?>(
    // Get.put()
    stream: FirebaseAuth.instance.authStateChanges(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(child: CircularProgressIndicator());
      }
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Application",
        initialRoute:
            snapshot.data != null ? Routes.BOTTOM_NAVBAR : Routes.AUTH,
        getPages: AppPages.routes,
      );
    },
  ));
}
