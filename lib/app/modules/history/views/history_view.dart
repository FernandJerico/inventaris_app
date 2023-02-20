import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';

import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/widget/Pemasukan.dart';
import '../../../utils/widget/Pengeluaran.dart';
import '../../item_detail/views/item_detail_view.dart';
import '../controllers/history_controller.dart';

class HistoryView extends GetView<HistoryController> {
  const HistoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String selected;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(239, 242, 247, 1),
      body: SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding:
                const EdgeInsets.only(right: 18, top: 10, bottom: 15, left: 18),
            child: GestureDetector(
              onTap: () =>
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ItemDetailView();
              })),
              child: const Text(
                "History",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 18, left: 18, bottom: 30),
            child: Container(
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(left: 40, right: 10),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Color.fromRGBO(98, 144, 142, 1)),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  hintText: 'Search...',
                  fillColor: Colors.white,
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                ),
              ),
            ),
          ),
          Expanded(
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('history')
                  .where('created',
                      isEqualTo: FirebaseAuth.instance.currentUser?.email)
                  .snapshots(),
              builder: (__,
                  AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                if (snapshot.hasError) {
                  return Text(
                    "error",
                    style: TextStyle(
                        fontSize: 100, color: Color.fromARGB(255, 226, 7, 7)),
                  );
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text("Loading");
                }
                final itemData = snapshot.requireData;

                return ListView.builder(
                    itemCount: itemData.size,
                    itemBuilder: (context, index) {
                      late int totalHarga = itemData.docs[index]['priceItem'] *
                          itemData.docs[index]['amountItem'];
                      return Padding(
                        padding: const EdgeInsets.only(
                            right: 15, left: 15, bottom: 10),
                        child: ListBody(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(top: 7),
                              height: 80,
                              width: 360,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              itemData.docs[index]['typeItem'],
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Color.fromARGB(
                                                      255, 58, 52, 52),
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 5),
                                                  child: Container(
                                                    height: 40,
                                                    width: 8,
                                                    decoration: BoxDecoration(
                                                        color: const Color
                                                                .fromARGB(
                                                            255, 50, 66, 78),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10)),
                                                    child: const Text(
                                                      "",
                                                      style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              177,
                                                              212,
                                                              241)),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 3),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        itemData.docs[index]
                                                            ['date'],
                                                        style: TextStyle(
                                                            fontSize: 13,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    58,
                                                                    52,
                                                                    52),
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      SizedBox(
                                                        height: 7,
                                                      ),
                                                      Text(
                                                        itemData.docs[index]
                                                            ['itemName'],
                                                        style: TextStyle(
                                                            fontSize: 13,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    58,
                                                                    52,
                                                                    52),
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 19, left: 150),
                                    child: Container(
                                      child: Column(
                                        children: [
                                          Text(
                                            itemData.docs[index]['amountItem']
                                                .toString(),
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Color.fromARGB(
                                                    255, 58, 52, 52),
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            'Rp. ${totalHarga.toString()},-',
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Color.fromARGB(
                                                    255, 58, 52, 52),
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    });
              },
            ),
          ),
        ]),
      ),
      floatingActionButton: Align(
        alignment: const Alignment(0.95, 0.95),
        child: FloatingActionButton.extended(
          onPressed: () {
            addEditTask(context: context, type: 'Add', docId: '');
          },
          backgroundColor: Color.fromRGBO(98, 142, 156, 1),
          label: const Text("Add"),
          icon: Icon(Icons.add),
        ),
      ),
    );
  }

  void addEditTask(
      {required BuildContext context,
      required String type,
      required String docId}) {
    final List<String> data = ["Pemasukan", "Pengeluaran"];

    TextEditingController controllerTypeItem = TextEditingController();
    TextEditingController controllerItemName = TextEditingController();
    TextEditingController controllerAmountItem = TextEditingController();
    TextEditingController controllerPriceItem = TextEditingController();
    TextEditingController controllerDate = TextEditingController();
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
                hintText: 'Pemasukan/Pengeluaran',
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
              controller: controllerTypeItem,
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
                hintText: 'Nama Barang',
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
                hintText: 'Jumlah Barang',
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
                hintText: 'Harga Item',
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
            DateTimePicker(
              firstDate: DateTime.now(),
              lastDate: DateTime(2100),
              decoration: InputDecoration(
                hintText: 'Date',
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
              controller: controllerDate,
              validator: ((value) {
                if (value == null || value.isEmpty) {
                  return 'Can not be empty';
                }
                return null;
              }),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: EdgeInsets.all(1.0),
              child: GestureDetector(
                onTap: () {
                  FirebaseFirestore.instance.collection('history').add({
                    'typeItem': controllerTypeItem.text,
                    'itemName': controllerItemName.text,
                    'amountItem': int.parse(controllerAmountItem.text),
                    'priceItem': int.parse(controllerPriceItem.text).toInt(),
                    'date': controllerDate.text,
                    'created': FirebaseAuth.instance.currentUser!.email,
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
                      "Add Data",
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
