import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:inventaris_app/firebase_options.dart';

import 'app/modules/home/views/homepage_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Inventaris App",
      home: HomePageView(),
    ),
  );
}
