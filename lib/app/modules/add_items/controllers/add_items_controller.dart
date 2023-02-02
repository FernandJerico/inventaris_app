import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../auth/controllers/auth_controller.dart';

class AddItemsController extends GetxController {
  //TODO: Implement AddItemsController
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  UserCredential? _userCredential;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final authC = Get.find<AuthController>();

  late TextEditingController idController,
      nameController,
      amountController,
      priceController;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    idController = TextEditingController();
    nameController = TextEditingController();
    amountController = TextEditingController();
    priceController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    idController.dispose();
    nameController.dispose();
    amountController.dispose();
    priceController.dispose();
  }

  void increment() => count.value++;

  void saveUpdateItem(
      {String? itemId,
      String? itemName,
      int? amountItem,
      int? priceItem}) async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    formKey.currentState!.save();
    CollectionReference itemColl = firestore.collection('item');
    CollectionReference usersColl = firestore.collection('users');
    var itemID = DateTime.now().toIso8601String();
    await itemColl.doc(itemID).set({
      'itemId': itemId,
      'itemName': itemName,
      'amountItem': amountItem,
      'priceItem': priceItem,
      'created_by': authC.auth.currentUser!.email,
    }).whenComplete(() async {
      await usersColl.doc(authC.auth.currentUser!.email).set({
        'item_id': FieldValue.arrayUnion([itemID])
      }, SetOptions(merge: true));
      Get.back();
      Get.snackbar('Item', 'Succesfully Add');
    }).catchError((error) {
      Get.snackbar('Item', 'Failed');
    });
  }
}
