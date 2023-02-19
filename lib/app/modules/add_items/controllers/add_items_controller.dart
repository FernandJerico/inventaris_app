import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../auth/controllers/auth_controller.dart';

class AddItemsController extends GetxController {
  //TODO: Implement AddItemsController
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  UserCredential? _userCredential;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  // final authC = Get.find<AuthController>();
  // final authC = Get.find<AuthController>();
  // final authC = Get.find<AuthController>();
  late TextEditingController idController,
      nameController,
      amountController,
      priceController;

  final count = 0.obs;
  var stok = 0.obs;
  var saldo = 0.obs;
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

  void tampilStok() async {
    var collection = FirebaseFirestore.instance.collection('inven');
    //userUid is the current auth user
    var docSnapshot =
        await collection.doc(FirebaseAuth.instance.currentUser!.email).get();

    var data = docSnapshot.data()!;
    // point += data['poin_belanja'];

    int stokk = (data['stok']).toInt();
    var a = [];
    var b = [];

    data != null ? stokk : a;
    data != null ? stokk : b;
    int saldoo = (data['saldo']).toInt();
    // point += pointt;
    // int a = pointt += poinPlus;
    stok += stokk;
    saldo += saldoo;

    update();
    print('stok database is ${stokk}');
    print('saldo di database is ${saldo}');
    // return p;
  }

  void tambahStok(int dataStok, int dataSald) {
    // stok += dataStok;
    var a = stok + (dataStok);
    var b = saldo + (dataSald);
    FirebaseFirestore.instance
        .collection('inven')
        .doc(FirebaseAuth.instance.currentUser!.email)
        .set({
      'stok': a.toInt(),
      'saldo': b.toInt(),
      'pemilik': FirebaseAuth.instance.currentUser!.email,

      // 'itemName': controllerItemName.text,
      // 'amountItem': int.parse(co`ntrollerAmountItem.text),
      // 'priceItem':
      // int.parse(controllerPriceItem.text).toDouble(),
      // 'created': FirebaseAuth.instance.currentUser!.email,
    });

    print(a);
    update();
    print('Stok Bertmaba menajdi : ${stok}');
    print('saldo Bertmaba menajdi: ${saldo}');
  }

  void clear() {
    stok = 0.obs;
    saldo = 0.obs;
    print('stok adalah : ${stok}');
    update();
  }

  void increment() => count.value++;

  // void saveUpdateItem(
  //     {String? itemId,
  //     String? itemName,
  //     int? amountItem,
  //     int? priceItem}) async {
  //   final isValid = formKey.currentState!.validate();
  //   if (!isValid) {
  //     return;
  //   }
  //   formKey.currentState!.save();
  //   CollectionReference itemColl = firestore.collection('item');
  //   CollectionReference usersColl = firestore.collection('users');
  //   var itemID = DateTime.now().toIso8601String();
  //   await itemColl.doc(itemID).set({
  //     'itemId': itemId,
  //     'itemName': itemName,
  //     'amountItem': amountItem,
  //     'priceItem': priceItem,
  //     'created_by': authC.auth.currentUser!.email,
  //   }).whenComplete(() async {
  //     await usersColl.doc(authC.auth.currentUser!.email).set({
  //       'item_id': FieldValue.arrayUnion([itemID])
  //     }, SetOptions(merge: true));
  //     Get.back();
  //     Get.snackbar('Item', 'Succesfully Add');
  //   }).catchError((error) {
  //     Get.snackbar('Item', 'Failed');
  //   });
  // }
}
