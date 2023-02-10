import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:inventaris_app/app/modules/add_items/controllers/add_items_controller.dart';
import 'package:inventaris_app/app/modules/items/controllers/item_controller.dart';
import 'package:inventaris_app/app/modules/items/views/items_view.dart';

import '../../../routes/app_pages.dart';

class AddItemsView extends GetView<AddItemsController> {
  // final controller = Get.put(AddItemsController());

  void clearText() {
    controller.idController.clear();
    controller.nameController.clear();
    controller.amountController.clear();
    controller.priceController.clear();
  }

  // Widget _createItem(context) {
  // final AddItemsController = Get.find();

  // }

  @override
  Widget build(BuildContext context) {
    late String itemId;
    late String itemName;
    late int amountItem;
    late int priceItem;
    TextEditingController controllerItemId = TextEditingController();
    TextEditingController controllerItemName = TextEditingController();
    TextEditingController controllerAmountItem = TextEditingController();
    TextEditingController controllerPriceItem = TextEditingController();
    return Scaffold(
      backgroundColor: const Color.fromRGBO(239, 242, 247, 1),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 18, left: 18),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                        size: 24,
                      ),
                    ),
                    const SizedBox(width: 5),
                    const Text(
                      "Add Items",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 36,
              ),
              Container(
                padding: const EdgeInsets.only(left: 18, right: 18),
                child: Form(
                  key: controller.formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Input Item ID :",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Item ID',
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding:
                              const EdgeInsets.only(left: 15, right: 10),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(98, 144, 142, 1))),
                        ),
                        controller: controllerItemId,
                        validator: ((value) {
                          if (value == null || value.isEmpty) {
                            return 'Can not be empty';
                          }
                          return null;
                        }),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Input Item Name :",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Item Name',
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding:
                              const EdgeInsets.only(left: 15, right: 10),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(98, 144, 142, 1))),
                        ),
                        controller: controllerItemName,
                        validator: ((value) {
                          if (value == null || value.isEmpty) {
                            return 'Can not be empty';
                          }
                          return null;
                        }),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Enter Amount :",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Amount',
                          // filled: t rue,
                          fillColor: Colors.white,
                          contentPadding:
                              const EdgeInsets.only(left: 15, right: 10),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(98, 144, 142, 1))),
                        ),
                        controller: controllerAmountItem,
                        validator: ((value) {
                          if (value == null || value.isEmpty) {
                            return 'Can not be empty';
                          }
                          return null;
                        }),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Input Price / Item :",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Price',
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding:
                              const EdgeInsets.only(left: 15, right: 10),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(98, 144, 142, 1))),
                        ),
                        controller: controllerPriceItem,
                        validator: ((value) {
                          if (value == null || value.isEmpty) {
                            return 'Can not be empty';
                          }
                          return null;
                        }),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Upload Photo :",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 90,
                          width: 90,
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 255, 255, 255),
                              borderRadius: BorderRadius.circular(10)),
                          child: const Center(
                            child: Icon(
                              Icons.add,
                              size: 80,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: GestureDetector(
                        onTap: clearText,
                        child: Container(
                          height: 70,
                          width: 150,
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 255, 255, 255),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color:
                                      const Color.fromRGBO(98, 142, 156, 1))),
                          child: const Center(
                            child: Text(
                              "Clear",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(98, 142, 156, 1),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: GestureDetector(
                        onTap: () {
                          //OBX STOK
                          var dataStok = int.parse(controllerAmountItem.text);
                          var dataSald = int.parse(controllerPriceItem.text);
                          controller.tambahStok(dataStok, dataSald);
                          //
                          FirebaseFirestore.instance.collection('item').add({
                            'itemId': controllerItemId.text,
                            'itemName': controllerItemName.text,
                            'amountItem': int.parse(controllerAmountItem.text),
                            'priceItem':
                                int.parse(controllerPriceItem.text).toDouble(),
                            'created': FirebaseAuth.instance.currentUser!.email,
                          });

                          Get.offAllNamed(Routes.BOTTOM_NAVBAR);
                        },
                        child: Container(
                          height: 70,
                          width: 150,
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(98, 142, 156, 1),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: const Color.fromARGB(
                                      255, 255, 255, 255))),
                          child: const Center(
                            child: Text(
                              "Save",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
