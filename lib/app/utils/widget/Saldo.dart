import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventaris_app/app/modules/add_items/controllers/add_items_controller.dart';
import 'package:inventaris_app/app/modules/profile/views/profile_view.dart';
import 'package:inventaris_app/app/utils/widget/form.dart';

class Saldo extends StatefulWidget {
  const Saldo({
    Key? key,
  }) : super(key: key);

  @override
  State<Saldo> createState() => _SaldoState();
}

final addController = Get.put(AddItemsController());

class _SaldoState extends State<Saldo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 25),
      height: 180,
      width: 212,
      decoration: BoxDecoration(
          color: const Color.fromARGB(199, 14, 35, 94),
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          GestureDetector(
              onTap: () {
                print("object");
                ProfileView();
              },
              child: Text(
                "Saldo",
                style: TextStyle(
                  fontSize: 50,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              )),
          const SizedBox(
            height: 30,
          ),
          Obx(() => Text(
                '${FormNUM.convertToIdr(addController.saldo.toInt(), 2)} -',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ))
        ],
      ),
    );
  }
}
