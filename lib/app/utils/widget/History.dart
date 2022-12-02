import 'package:flutter/material.dart';

class History extends StatelessWidget {
  const History({
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
              Icons.history,
              size: 70,
              color: Colors.white,
            ),
          ),
          Column(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 15, top: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "History",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Klik disini untuk melihat semua",
                            style: TextStyle(
                              fontSize: 17,
                              color: Color.fromARGB(255, 177, 212, 241),
                            )),
                        const Text("Riwayat Transaksi!",
                            style: TextStyle(
                              fontSize: 17,
                              color: Color.fromARGB(255, 199, 214, 226),
                            )),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
