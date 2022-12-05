import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../utils/widget/BottomNavbar.dart';
import '../controllers/item_detail_controller.dart';

class ItemDetailView extends GetView<ItemDetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(239, 242, 247, 1),
      bottomNavigationBar: const BottomNavbar(),
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
                        onTap: () => Get.toNamed('/item'),
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                          size: 24,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 200,
                        width: 200,
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: const DecorationImage(
                                image: NetworkImage(
                                  'https://i.imgur.com/APmrQQB.jpeg',
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
                  child: const Text(
                    "Beng-beng",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: Color.fromRGBO(0, 0, 0, 67),
                    ),
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
                    children: const [
                      Text(
                        "Id: ",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: Color.fromRGBO(0, 0, 0, 67),
                        ),
                      ),
                      Text(" 8196142770",
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
                    children: const [
                      Text(
                        "Harga: ",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: Color.fromRGBO(0, 0, 0, 67),
                        ),
                      ),
                      Text("Rp.2000",
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
                    children: const [
                      Text(
                        "Stock: ",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: Color.fromRGBO(0, 0, 0, 67),
                        ),
                      ),
                      Text("50",
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
                    children: const [
                      Text(
                        "Total Harga: ",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: Color.fromRGBO(0, 0, 0, 67),
                        ),
                      ),
                      Text("Rp.100.000",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                            color: Color.fromRGBO(0, 0, 0, 67),
                          ))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
