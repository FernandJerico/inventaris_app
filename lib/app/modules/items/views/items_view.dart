import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:inventaris_app/app/modules/add_items/controllers/add_items_controller.dart';
import 'package:inventaris_app/app/modules/add_items/views/add_items_view.dart';
import 'package:inventaris_app/app/modules/auth/controllers/auth_controller.dart';
import '../../item_detail/views/item_detail_view.dart';
import '../controllers/item_controller.dart';

class ItemView extends GetView<ItemController> {
  final itemController = Get.put(ItemController());
  // final itemController = Get.put(ItemController());
  final authC = Get.find<AuthController>();
  final addController = Get.put(AddItemsController());

  //documents IDs
  List<String> docIDs = [];

  //get docIDs
  Future getDocIds() async {
    await FirebaseFirestore.instance.collection('users').get().then(
          (snapshot) => snapshot.docs.forEach((document) {
            print(document.reference);
            docIDs.add(document.reference.id);
          }),
        );
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(239, 242, 247, 1),
      body: SafeArea(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding:
              const EdgeInsets.only(right: 18, top: 10, bottom: 15, left: 18),
          child: GestureDetector(
            onTap: () =>
                Navigator.push(context, MaterialPageRoute(builder: (context) {
              return ItemDetailView();
            })),
            child: const Text(
              "Items",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 18, left: 18),
                child: Container(
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.only(left: 40, right: 10),
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
              const SizedBox(
                height: 10,
              ),
              //   Row(
              //     children: [
              //       const Padding(
              //         padding: EdgeInsets.only(left: 18),
              //         child: Text(
              //           "Sort by :",
              //           style:
              //               TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
              //         ),
              //       ),
              //       Padding(
              //         padding: const EdgeInsets.only(left: 7),
              //         child: Obx(
              //           () => DropdownButton<String>(
              //             value: itemController.selected.value == ""
              //                 ? null
              //                 : itemController.selected.value,
              //             onChanged: (newValue) {
              //               print(newValue);
              //               itemController.setSelected(newValue!);
              //             },
              //             items: itemController.items
              //                 .map(
              //                   (e) => DropdownMenuItem(
              //                     value: e,
              //                     child: Text(e),
              //                   ),
              //                 )
              //                 .toList(),
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
            ],
          ),
        ),
        Expanded(
            // stream users to get item list
            child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('item')
                    .where('created',
                        isEqualTo: FirebaseAuth.instance.currentUser?.email)
                    // .where('amountItem', isEqualTo: 2)
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
                      // itemCount: itemData.size,
                      itemCount: itemData.size,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            print(FirebaseAuth.instance.currentUser!.email);
                            // Get.to(TestisView());
                            Get.to(() => ItemDetailView(), arguments: {
                              "Gambar": itemData.docs[index]['gambar'],
                              "NamaBarang": itemData.docs[index]['itemName'],
                              "Stok":
                                  itemData.docs[index]['amountItem'].toString(),
                              "Harga":
                                  itemData.docs[index]['priceItem'].toString(),
                              "ID": itemData.docs[index]['itemId'],
                              'IdCol': itemData.docs[index].id,
                              "TotalHarga": itemData.docs[index]['priceItem'] *
                                  itemData.docs[index]['amountItem'],
                            });
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
                                        child: Image(
                                          image: NetworkImage(
                                            itemData.docs[index]['gambar'],
                                          ),
                                          height: 70,
                                          width: 70,
                                        ),
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
                                                      'Rp. ${itemData.docs[index]['priceItem'].toString()},-',
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addController.clear();
          addController.tampilStok();
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return AddItemsView();
          }));
        },
        backgroundColor: const Color.fromRGBO(98, 142, 156, 100),
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }
}
