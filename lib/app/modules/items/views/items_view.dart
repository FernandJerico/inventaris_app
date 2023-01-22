import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:inventaris_app/app/modules/add_items/views/add_items_view.dart';
import 'package:inventaris_app/app/modules/auth/controllers/auth_controller.dart';
import '../../item_detail/views/item_detail_view.dart';
import '../controllers/item_controller.dart';

class ItemView extends GetView<ItemController> {
  final itemController = Get.put(ItemController());
  final authC = Get.find<AuthController>();

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
    return Scaffold(
      backgroundColor: const Color.fromRGBO(239, 242, 247, 1),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  right: 18, top: 10, bottom: 15, left: 18),
              child: GestureDetector(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
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
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 18),
                        child: Text(
                          "Sort by :",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w700),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 7),
                        child: Obx(
                          () => DropdownButton<String>(
                            value: itemController.selected.value == ""
                                ? null
                                : itemController.selected.value,
                            onChanged: (newValue) {
                              print(newValue);
                              itemController.setSelected(newValue!);
                            },
                            items: itemController.items
                                .map(
                                  (e) => DropdownMenuItem(
                                    value: e,
                                    child: Text(e),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
                // stream users to get item list
                child: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                    stream: authC.streamUsers(
                      authC.auth.currentUser!.email!,
                    ),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      // get item id
                      var itemId = (snapshot.data!.data()
                          as Map<String, dynamic>)['item_id'] as List;
                      return ListView.builder(
                          itemCount: itemId.length,
                          // itemCount: docIDs.length,
                          itemBuilder: (context, index) {
                            return StreamBuilder<
                                    DocumentSnapshot<Map<String, dynamic>>>(
                                stream: authC.streamItem(itemId[index]),
                                builder: (context, snapshot2) {
                                  if (snapshot2.connectionState ==
                                      ConnectionState.waiting) {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }
                                  var dataItem = snapshot2.data!.data();
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      right: 15,
                                      left: 15,
                                    ),
                                    child: ListBody(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 10),
                                          child: Container(
                                            padding:
                                                const EdgeInsets.only(top: 7),
                                            height: 80,
                                            width: 480,
                                            decoration: BoxDecoration(
                                              color: const Color.fromARGB(
                                                  232, 255, 255, 255),
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 7, bottom: 7),
                                                  child: SizedBox(
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      child: const Image(
                                                          image: NetworkImage(
                                                        'https://i.imgur.com/APmrQQB.jpeg',
                                                      )),
                                                    ),
                                                  ),
                                                ),
                                                StreamBuilder<
                                                        DocumentSnapshot<
                                                            Map<String,
                                                                dynamic>>>(
                                                    stream: authC.streamItem(
                                                        itemId[index]),
                                                    builder:
                                                        (context, snapshot2) {
                                                      if (snapshot2
                                                              .connectionState ==
                                                          ConnectionState
                                                              .waiting) {
                                                        return const Center(
                                                          child:
                                                              CircularProgressIndicator(),
                                                        );
                                                      }
                                                      var dataItem = snapshot2
                                                          .data!
                                                          .data();
                                                      return Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(left: 8),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              dataItem![
                                                                  'itemName'],
                                                              style: TextStyle(
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w900,
                                                                color: Color
                                                                    .fromRGBO(
                                                                        0,
                                                                        0,
                                                                        0,
                                                                        67),
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              height: 20,
                                                            ),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  'ID : ' +
                                                                      dataItem[
                                                                          'itemId'],
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w900,
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            0,
                                                                            0,
                                                                            0,
                                                                            67),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    }),
                                                const SizedBox(width: 120),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 1),
                                                  child: Expanded(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          dataItem![
                                                              'amountItem'],
                                                          style: TextStyle(
                                                            fontSize: 30,
                                                            fontWeight:
                                                                FontWeight.w900,
                                                            color:
                                                                Color.fromRGBO(
                                                                    0,
                                                                    0,
                                                                    0,
                                                                    67),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: 7,
                                                        ),
                                                        Container(
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                'Rp.' +
                                                                    dataItem[
                                                                        'priceItem'] +
                                                                    ',-',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w900,
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          0,
                                                                          0,
                                                                          0,
                                                                          67),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                });
                          });
                    }))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Navigator.push(context, MaterialPageRoute(builder: (context) {
          return AddItemsView();
        })),
        backgroundColor: const Color.fromRGBO(98, 142, 156, 100),
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }
}
