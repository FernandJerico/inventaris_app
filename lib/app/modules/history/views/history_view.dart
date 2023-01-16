import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../utils/widget/Pemasukan.dart';
import '../../../utils/widget/Pengeluaran.dart';
import '../../item_detail/views/item_detail_view.dart';
import '../controllers/history_controller.dart';

class HistoryView extends GetView<HistoryController> {
  const HistoryView({Key? key}) : super(key: key);
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
                child: ListView.builder(
                    itemCount: 6,
                    // itemCount: docIDs.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            right: 15, left: 15, bottom: 10),
                        child: ListBody(
                          children: [
                            Pemasukan(),
                          ],
                        ),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
