import 'package:flutter/material.dart';

class TransaksiTerakhir extends StatelessWidget {
  const TransaksiTerakhir({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 7),
      height: 120,
      width: 376,
      decoration: BoxDecoration(
          color: const Color.fromARGB(199, 14, 35, 94),
          borderRadius: BorderRadius.circular(15)),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 9),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 3, top: 2),
                      child: Text(
                        "Transaksi Terakhir : ",
                        style: TextStyle(
                            fontSize: 23,
                            color: Color.fromARGB(255, 177, 212, 241),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 4, right: 7),
                          child: Container(
                            height: 65,
                            width: 8,
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 177, 212, 241),
                                borderRadius: BorderRadius.circular(10)),
                            child: const Text(
                              ".",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 177, 212, 241)),
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 3, left: 2),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Pemasukan No.50",
                                style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "11/11/2022",
                                style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "Toko Suka Maju",
                                style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 18,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 35, left: 20),
            child: Container(
              child: Column(
                children: const [
                  Text(
                    "100",
                    style: TextStyle(
                        fontSize: 35,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Rp. 110.000,-",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
