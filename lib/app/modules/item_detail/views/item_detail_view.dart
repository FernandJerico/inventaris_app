import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../../add_items/controllers/add_items_controller.dart';
import '../../auth/controllers/auth_controller.dart';
import '../../items/controllers/item_controller.dart';
import '../controllers/item_detail_controller.dart';

class ItemDetailView extends GetView<ItemDetailController> {
  final itemController = Get.put(ItemController());
  final authC = Get.find<AuthController>();

  // final ItemName itemName = Get.arguments['itemName'];
  // final Dt dt
  // final List<Dt> dt;
  // ItemDetailView({super.key, required this.dt});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemDetailController());
    return Scaffold(
      backgroundColor: const Color.fromRGBO(239, 242, 247, 1),
      body: SafeArea(
        child: Center(
          child: Container(
            width: 480,
            height: Get.height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: const Color.fromARGB(94, 80, 78, 78),
              ),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 18, left: 18),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () => Get.back(),
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                          size: 24,
                        ),
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: NetworkImage(
                                  Get.arguments['Gambar'],
                                ),
                                fit: BoxFit.cover)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.only(
                      bottom: 3, left: 18, top: 3, right: 18),
                  width: Get.width,
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Color.fromARGB(94, 80, 78, 78),
                        width: 1,
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Nama Barang : ',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: Color.fromRGBO(0, 0, 0, 67),
                        ),
                      ),
                      Text(
                        Get.arguments['NamaBarang'],
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: Color.fromRGBO(0, 0, 0, 67),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(
                      bottom: 3, left: 18, top: 5, right: 18),
                  width: Get.width,
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Color.fromARGB(94, 80, 78, 78),
                        width: 1,
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "ID: ",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: Color.fromRGBO(0, 0, 0, 67),
                        ),
                      ),
                      Text(Get.arguments['ID'],
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                            color: Color.fromRGBO(0, 0, 0, 67),
                          ))
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(
                      bottom: 3, left: 18, top: 5, right: 18),
                  width: Get.width,
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Color.fromARGB(94, 80, 78, 78),
                        width: 1,
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Harga: ",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: Color.fromRGBO(0, 0, 0, 67),
                        ),
                      ),
                      Text('Rp.${Get.arguments['Harga'].toString()},-',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                            color: Color.fromRGBO(0, 0, 0, 67),
                          ))
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(
                      bottom: 3, left: 18, top: 5, right: 18),
                  width: Get.width,
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Color.fromARGB(94, 80, 78, 78),
                        width: 1,
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Stock: ",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: Color.fromRGBO(0, 0, 0, 67),
                        ),
                      ),
                      Text(Get.arguments['Stok'].toString(),
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                            color: Color.fromRGBO(0, 0, 0, 67),
                          ))
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(
                      bottom: 3, left: 18, top: 5, right: 18),
                  width: Get.width,
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Color.fromARGB(94, 80, 78, 78),
                        width: 1,
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total Harga: ",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: Color.fromRGBO(0, 0, 0, 67),
                        ),
                      ),
                      Text('Rp.${Get.arguments['TotalHarga'].toString()},-',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                            color: Color.fromRGBO(0, 0, 0, 67),
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: GestureDetector(
                    onTap: (() {
                      var a = Get.arguments['IdCol'];
                      var b = Get.arguments['saldo'];
                      var h = Get.arguments['TotalHarga'];
                      var s = Get.arguments['Stok'];
                      print(h);
                      print(s);

                      controller.tampilStok();
                      controller.deleteItem(a, b, h, s);
                    }),
                    child: Container(
                      height: 40,
                      width: 80,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 252, 50, 36),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Text(
                          "Delete",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Align(
        alignment: const Alignment(0.95, 0.95),
        child: FloatingActionButton.extended(
          onPressed: () {
            addEditItem(context: context, type: 'Edit', docId: '');
          },
          backgroundColor: Color.fromRGBO(98, 142, 156, 1),
          label: const Text("Edit"),
          icon: Icon(Icons.add),
        ),
      ),
    );
  }

  void addEditItem(
      {required BuildContext context,
      required String type,
      required String docId}) {
    TextEditingController controllerItemId = TextEditingController();
    TextEditingController controllerItemName = TextEditingController();
    TextEditingController controllerPriceItem = TextEditingController();
    TextEditingController controllerAmountItem = TextEditingController();
    TextEditingController controllerGambar = TextEditingController();
    Get.bottomSheet(SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.only(top: 20, left: 25, right: 25),
        margin: context.isPhone
            ? const EdgeInsets.only()
            : const EdgeInsets.only(left: 120, right: 120),
        height: 500,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            color: Colors.white),
        child: Form(
            child: Column(
          children: [
            Text(
              '$type Data',
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            TextFormField(
              decoration: InputDecoration(
                hintText: Get.arguments['ID'],
                contentPadding: const EdgeInsets.only(left: 15, right: 10),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.black),
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        BorderSide(color: Color.fromRGBO(98, 144, 142, 1))),
              ),
              controller: controllerItemId,
              validator: ((value) {
                if (value == null || value.isEmpty) {
                  return 'Can not be empty';
                }
                return null;
              }),
            ),
            const SizedBox(height: 15),
            TextFormField(
              decoration: InputDecoration(
                hintText: Get.arguments['NamaBarang'],
                contentPadding: const EdgeInsets.only(left: 15, right: 10),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.black),
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        BorderSide(color: Color.fromRGBO(98, 144, 142, 1))),
              ),
              controller: controllerItemName,
              validator: ((value) {
                if (value == null || value.isEmpty) {
                  return 'Can not be empty';
                }
                return null;
              }),
            ),
            const SizedBox(height: 15),
            TextFormField(
              decoration: InputDecoration(
                hintText: Get.arguments['Stok'],
                contentPadding: const EdgeInsets.only(left: 15, right: 10),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.black),
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        BorderSide(color: Color.fromRGBO(98, 144, 142, 1))),
              ),
              controller: controllerAmountItem,
              validator: ((value) {
                if (value == null || value.isEmpty) {
                  return 'Can not be empty';
                }
                return null;
              }),
            ),
            const SizedBox(height: 15),
            TextFormField(
              decoration: InputDecoration(
                hintText: Get.arguments['Harga'],
                contentPadding: const EdgeInsets.only(left: 15, right: 10),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.black),
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        BorderSide(color: Color.fromRGBO(98, 144, 142, 1))),
              ),
              controller: controllerPriceItem,
              validator: ((value) {
                if (value == null || value.isEmpty) {
                  return 'Can not be empty';
                }
                return null;
              }),
            ),
            const SizedBox(height: 15),
            GetBuilder<AddItemsController>(
              init: AddItemsController(),
              initState: (_) {},
              builder: (_) {
                return GestureDetector(
                  onTap: () {
                    controller.pickUpImage();
                  },
                  child: Container(
                    height: 60,
                    width: 60,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(10)),
                    child: controller.gm == ""
                        ? Icon(
                            Icons.add,
                            color: Color.fromRGBO(98, 144, 142, 1),
                            size: 45,
                          )
                        : Image.network(
                            controller.gm,
                            height: 50,
                          ),
                  ),
                );
              },
            ),
            const SizedBox(height: 15),
            Padding(
              padding: EdgeInsets.all(1.0),
              child: GestureDetector(
                onTap: () {
                  FirebaseFirestore.instance.collection('item').add({
                    'itemId': controllerItemId.text,
                    'itemName': controllerItemName.text,
                    'amountItem': int.parse(controllerAmountItem.text),
                    'priceItem': int.parse(controllerPriceItem.text).toInt(),
                    // 'gambar': controllerGambar,
                  });
                  Get.offAllNamed(Routes.BOTTOM_NAVBAR);
                },
                child: Container(
                  width: Get.width,
                  height: 40,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(98, 142, 156, 1),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: const Color.fromARGB(255, 255, 255, 255))),
                  child: const Center(
                    child: Text(
                      "Edit Data",
                      style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        )),
      ),
    ));
  }
}
