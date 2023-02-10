import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:inventaris_app/app/modules/add_items/views/add_items_view.dart';
import 'package:inventaris_app/app/modules/item_detail/views/item_detail_view.dart';
import 'package:inventaris_app/app/modules/items/controllers/item_controller.dart';

import '../controllers/testis_controller.dart';

class TestisView extends GetView<TestisController> {
  TestisView({Key? key}) : super(key: key);
  final itemController = Get.put(ItemController());

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(239, 242, 247, 1),
      body: SafeArea(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(
            // stream users to get item list
            child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('item')
                    .where('created_by',
                        isEqualTo: 'EEBTVUnwqHXyuHlIu8S3VMIoFi53')
                    .snapshots(),
                builder: (__,
                    AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                        snapshot) {
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
                      // itemCount: docIDs.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            print(FirebaseAuth.instance.currentUser!.uid);

                            // Get.to(() => ItemDetailView(), arguments: {
                            //   "NamaBarang": itemData.docs[index]['itemName'],
                            //   "Stok":
                            //       itemData.docs[index]['amountItem'].toString(),
                            //   "Harga":
                            //       itemData.docs[index]['priceItem'].toString(),
                            //   "ID": itemData.docs[index]['itemId'],
                            //   "TotalHarga": itemData.docs[index]['priceItem'] *
                            //       itemData.docs[index]['amountItem'],
                            // });
                            print("as");
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Container(
                              padding: const EdgeInsets.only(top: 7),
                              height: 80,
                              width: 480,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(232, 255, 255, 255),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 7, bottom: 7),
                                    child: SizedBox(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: const Image(
                                            image: NetworkImage(
                                          'https://i.imgur.com/APmrQQB.jpeg',
                                        )),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(left: 5),
                                    width: 300,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              itemData.docs[index]['itemName'],
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w900,
                                                color:
                                                    Color.fromRGBO(0, 0, 0, 67),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Container(
                                              child: Text(
                                                'ID : ${itemData.docs[index]['itemId']}',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w900,
                                                  color: Color.fromRGBO(
                                                      0, 0, 0, 67),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 1),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                itemData.docs[index]
                                                        ['amountItem']
                                                    .toString(),
                                                style: TextStyle(
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.w900,
                                                  color: Color.fromRGBO(
                                                      0, 0, 0, 67),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 7,
                                              ),
                                              Container(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      itemData.docs[index]
                                                          ['itemId'],
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w900,
                                                        color: Color.fromRGBO(
                                                            0, 0, 0, 67),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                }))
      ])),
    );
  }
}
