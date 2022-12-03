import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../utils/widget/BottomNavbar.dart';
import '../../../utils/widget/Pemasukan.dart';
import '../../../utils/widget/Pengeluaran.dart';
import '../controllers/history_controller.dart';

class HistoryView extends GetView<HistoryController> {
  const HistoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(239, 242, 247, 1),
      bottomNavigationBar: BottomNavbar(),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 28,
                right: 160,
                top: 20,
                bottom: 15,
              ),
              child: Container(
                child: Column(
                  children: const [
                    Text(
                      "Riwayat Transaksi",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Container(
                padding: EdgeInsets.only(left: 5, top: 8, bottom: 5),
                height: 40,
                width: 360,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Icon(
                      Icons.search,
                      size: 17,
                      color: Colors.black,
                    ),
                    SizedBox(width: 10),
                    Text("Search.."),
                  ],
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: const [
                    Pemasukan(),
                    SizedBox(height: 10),
                    Pengeluaran(),
                    SizedBox(height: 10),
                    Pemasukan(),
                    SizedBox(height: 10),
                    Pengeluaran(),
                    SizedBox(height: 10),
                    Pemasukan(),
                    SizedBox(height: 10),
                    Pengeluaran(),
                    SizedBox(height: 10),
                    Pemasukan(),
                    SizedBox(height: 10),
                    Pengeluaran(),
                    SizedBox(height: 10),
                    Pemasukan(),
                    SizedBox(height: 10),
                    Pengeluaran(),
                    SizedBox(height: 10),
                    Pemasukan(),
                    SizedBox(height: 10),
                    Pengeluaran(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
