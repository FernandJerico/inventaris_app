import 'package:flutter/material.dart';
import 'package:inventaris_app/app/modules/profile/views/profile_view.dart';

class Saldo extends StatelessWidget {
  const Saldo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 25),
      height: 180,
      width: 220,
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
            child: const Text(
              "Saldo",
              style: TextStyle(
                fontSize: 35,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          const Text(
            "Rp. 1.500.000,-",
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
