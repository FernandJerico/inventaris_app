import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../modules/add_items/controllers/add_items_controller.dart';

class Stock extends StatefulWidget {
  Stock({
    Key? key,
  }) : super(key: key);
  @override
  State<Stock> createState() => _StockState();
}

final addController = Get.put(AddItemsController());

class _StockState extends State<Stock> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 12),
      height: 86.97,
      width: 160,
      decoration: BoxDecoration(
          color: Color.fromARGB(199, 14, 35, 94),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Text(
            "Stock",
            style: TextStyle(
              fontSize: 22,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Obx(() => Text(
                addController.stok.toString(),
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ))
        ],
      ),
    );
  }
}
