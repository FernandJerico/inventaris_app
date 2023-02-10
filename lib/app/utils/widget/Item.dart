import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventaris_app/app/modules/items/views/items_view.dart';

class Item extends StatelessWidget {
  const Item({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 5, left: 15, bottom: 5),
      height: 120,
      width: 375,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Container(
            height: 90,
            width: 90,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 177, 212, 241),
                borderRadius: BorderRadius.circular(15)),
            child: const Icon(
              Icons.view_in_ar,
              size: 70,
              color: Colors.white,
            ),
          ),
          Column(
            children: [
              InkWell(
                onTap: () {
                  Get.to(ItemView());
                },
                child: Container(
                  padding: const EdgeInsets.only(left: 15, top: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Item",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("Klik disini untuk melihat semua",
                              style: TextStyle(
                                fontSize: 17,
                                color: Color.fromARGB(255, 177, 212, 241),
                              )),
                          Text("Item!",
                              style: TextStyle(
                                fontSize: 17,
                                color: Color.fromARGB(255, 177, 212, 241),
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
